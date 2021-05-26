# frozen_string_literal: true

require 'openssl'
require 'typhoeus'
require 'uri'
require 'json'
module TencentCloud
  module Common
    module Http
      class Sign
        attr_accessor :credential, :request, :klass

        SIGNED_HEADERS = %w[host content-type].freeze
        ALGORITHM = 'TC3-HMAC-SHA256'
        # TencentCloud::Common::Http::Sign.new(credential, klass, request)

        def initialize(credential, klass, request)
          unless credential.is_a?(TencentCloud::Common::Credential)
            raise Exception::TencentCloudSDKException, "InvalidCredential, #{credential} is not a TencentCloud::Common::Credential"
          end

          self.credential = credential
          self.request = request
          self.klass = klass
        end

        def sign_tc3
          # ************* 步骤 1：拼接规范请求串 *************
          time = Time.now.utc
          timestamp = time.to_i
          date = time.strftime('%F')
          # TODO: DEBUG
          # timestamp = 1551113065
          # date = Time.at(timestamp).utc.strftime('%Y-%m-%d')

          canonical_request = [
            http_request_method,
            canonical_uri,
            canonical_querystring,
            canonical_headers,
            signed_headers,
            hashed_request_payload
          ].join("\n")
          # ************* 步骤 2：拼接待签名字符串 *************
          credential_scope = "#{date}/#{klass::SERVICE_NAME}/tc3_request"

          hashed_request = Digest::SHA256.hexdigest(canonical_request)

          string_to_sign = [
            ALGORITHM,
            timestamp.to_s,
            credential_scope,
            hashed_request
          ].join("\n")
          # ************* 步骤 3：计算签名 *************
          digest = OpenSSL::Digest.new('sha256')
          secret_date = OpenSSL::HMAC.digest(digest, 'TC3' + credential.secret_key, date)
          secret_service = OpenSSL::HMAC.digest(digest, secret_date, klass::SERVICE_NAME)
          secret_signing = OpenSSL::HMAC.digest(digest, secret_service, 'tc3_request')
          signature = OpenSSL::HMAC.hexdigest(digest, secret_signing, string_to_sign)

          # ************* 步骤 4：拼接 Authorization *************
          authorization = ALGORITHM + ' ' \
                          "Credential=#{credential.secret_id}/#{credential_scope}" + ', ' \
                          'SignedHeaders=' + signed_headers + ', ' \
                          'Signature=' + signature
          authorization
        end

        def hashed_request_payload
          payload = request.options[:body]
          Digest::SHA256.hexdigest payload
        end

        def http_request_method
          (request.options[:method] || 'get').upcase
        end

        def canonical_uri
          uri = URI(request.base_url)
          url_path = CGI.escape(uri.path)
          url_path == '' ? '/' : url_path
        end

        def canonical_headers
          headers_to_sign = []
          request.options[:headers].each do |k, v|
            headers_to_sign << "#{k.to_s.downcase}:#{v}\n" if SIGNED_HEADERS.include?(k)
          end
          headers_to_sign.compact.sort.join('')
        end

        def signed_headers
          SIGNED_HEADERS.map(&:downcase).sort.join(';')
        end

        # For POST method, this is a fixed value
        def canonical_querystring
          ''
        end
      end
    end
  end
end
