# frozen_string_literal: true

require 'tencent_cloud/common/exception/tencent_cloud_sdk_exception'
require 'tencent_cloud/common/credential'
require 'tencent_cloud/common/http/request'
require 'tencent_cloud/common/http/sign'
module TencentCloud
  module Common
    class BaseClient
      def initialize(credential)
        @credential = credential
      end

      def camel_case(str)
        return str if str !~ /_/ && str =~ /[A-Z]+.*/

        str.split('_').map(&:capitalize).join
      end

      def get_response(action, body)
        headers = {
          'X-TC-Action' => action,
          'X-TC-Version' => self.class::API_VERSION,
          'X-TC-Region' => 'ap-guangzhou',
          'X-TC-Timestamp' => Time.now.to_i
        }
        request = TencentCloud::Common::Http::Request.new @credential, self.class, headers: headers, body: JSON.generate(body, space: ' ')
        request.run
      end

      def method_missing(m, body)
        unless self.class::APIS.keys.include?(m)
          raise TencentCloud::Common::Exception::TencentCloudSDKException, 'InvalidMethod, method not found'
        end

        api = self.class::APIS[m]
        unless body.is_a?(Hash)
          raise TencentCloud::Common::Exception::TencentCloudSDKException, 'InvalidPayload, payload must be a hash'
        end

        get_response(api, body)
        # puts "There's no method called #{m} here -- please try again."
      end
    end
  end
end
