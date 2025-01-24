# frozen_string_literal: true
require 'base64'
require 'openssl'
require 'net/http'
require 'uri'
require 'cgi'
require 'json'
module TencentCloud
  class TpnsClient
    API_VERSION = '2021-04-22'
    ENDPOINTS = {
      'gz' => 'https://api.tpns.tencent.com',
      'sh' => 'https://api.tpns.sh.tencent.com',
      'hk' => 'https://tpns.acecamptech.com', # https://api.tpns.hk.tencent.com
      'sg' => 'https://api.tpns.sgp.tencent.com'
    }

    def initialize(access_id, secret_key, region)
      @access_id = access_id
      @secret_key = secret_key
      @end_point = ENDPOINTS[region.to_s]
    end

    def http_request(api_path, data)
      current_timestamp = Time.current.to_i.to_s
      uri = URI.parse("#{@end_point}#{api_path}")

      request = Net::HTTP::Post.new(uri.to_s)
      request.body = data.to_json
      request.initialize_http_header({AccessId: @access_id, TimeStamp: current_timestamp, Sign: sign(current_timestamp, request.body)})
      request.set_content_type 'application/json'

      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request request
      end
    end

    def sign(current_timestamp, body)
      Base64.strict_encode64(OpenSSL::HMAC.hexdigest('sha256', @secret_key, "#{current_timestamp}#{@access_id}#{body}"))
    end
  end
end