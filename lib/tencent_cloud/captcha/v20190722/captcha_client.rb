# frozen_string_literal: true

require 'json'

module TencentCloud
  class CaptchaClient < TencentCloud::Common::AbstractClient
    API_VERSION = '2019-07-22'
    Action = 'DescribeCaptchaResult'
    CaptchaType = 9
    REQUEST_PATH = '/'
    JSON_CONTENT = 'application/json'
    MULTIPART_CONTENT = 'multipart/form-data'
    FORM_URLENCODED_CONTENT = 'application/x-www-form-urlencoded'
    ENDPOINT = 'captcha.tencentcloudapi.com'

    def initialize(secret_id, secret_key)
      @api_version = '2019-07-22'
      @secret_id = secret_id
      @secret_key = secret_key
      @token = nil
      @region = nil
    end

    def http_request(data)
      uri = URI.parse("https://#{ENDPOINT}")
      request = Net::HTTP::Post.new(uri.to_s)
      request = build_req_with_v3_signature(Action, data, request, options = {})

      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request request
      end
    end
    def build_req_with_v3_signature(action, params, req, options = {})
      content_type = JSON_CONTENT
      timestamp = Time.current.to_i
      header = {}
      header['Content-Type'] = content_type
      header['Host'] = ENDPOINT
      header['X-TC-Action'] = action
      header['X-TC-Timestamp'] = timestamp
      header['X-TC-Version'] = @api_version
      header['X-TC-Region'] = @region
      header['X-TC-Token'] = @token if @token
      req.body = JSON.generate(params, { 'ascii_only' => true, 'space' => ' ' })
      payload = req.body
      canonical_querystring = ''
      hashed_payload = Digest::SHA256.hexdigest(payload)

      authorization = sign_v3(content_type, ENDPOINT, 'POST', '/',
                              canonical_querystring, hashed_payload, header['X-TC-Timestamp'],
                              @secret_id, @secret_key)
      header['Authorization'] = authorization
      header.each do |k, v|
        req[k] = v
      end
      req
    end
    def sign_v3(content_type, endpoint, method, uri, query, payload, timestamp, secret_id, secret_key)
      canonical_headers = "content-type:#{content_type}\nhost:#{endpoint}\n"
      signed_headers = 'content-type;host'
      canonical_request = [
        method,
        uri,
        query,
        canonical_headers,
        signed_headers,
        payload,
      ].join("\n")
      service = endpoint.split('.')[0]

      date = Time.at(timestamp).utc.strftime('%Y-%m-%d')
      credential_scope = date + '/' + service + '/' + 'tc3_request'
      algorithm = 'TC3-HMAC-SHA256'
      hashed_request_payload = Digest::SHA256.hexdigest(canonical_request)
      string_to_sign = [
        algorithm,
        timestamp,
        credential_scope,
        hashed_request_payload,
      ].join("\n")

      digest = OpenSSL::Digest.new('sha256')
      secret_date = OpenSSL::HMAC.digest(digest, 'TC3' + secret_key, date)
      secret_service = OpenSSL::HMAC.digest(digest, secret_date, service)
      secret_signing = OpenSSL::HMAC.digest(digest, secret_service, 'tc3_request')
      signature = OpenSSL::HMAC.hexdigest(digest, secret_signing, string_to_sign)
      "#{algorithm} Credential=#{secret_id}/#{credential_scope}, SignedHeaders=#{signed_headers}, Signature=#{signature}"
    end
    def format_params(prefix = nil, params)
      d = {}
      case params
      when Hash
        params.each do |k, v|
          key = prefix ? "#{prefix}.#{k}" : k.to_s
          d.update(format_params(key, v))
        end
      when Array
        params.each_with_index do |v, i|
          key = prefix ? "#{prefix}.#{i}" : i.to_s
          d.update(format_params(key, v))
        end
      else
        d[prefix] = params
      end
      d
    end
  end
end