# frozen_string_literal: true

module TencentCloud
  module Common
    class Credential
      attr_accessor :secret_id, :secret_key, :token

      # Tencent Cloud Credentials.
      # Access https://console.cloud.tencent.com/cam/capi to manage your
      # credentials.
      # :param secret_id: The secret id of your credential.
      # :type secret_id: string
      # :param secret_key: The secret key of your credential.
      # :type secret_key: string
      # :param token: The federation token of your credential, if this field
      #               is specified, secret_id and secret_key should be set
      #               accordingly, see: https://cloud.tencent.com/document/product/598/13896
      def initialize(secret_id, secret_key, token = nil)
        self.secret_id = secret_id if validate(:secret_id, secret_id)
        self.secret_key = secret_key if validate(:secret_key, secret_key)
        self.token = token
      end

      private

      def validate(key, value)
        value = value.to_s
        if value.nil? || value.strip.empty?
          raise Exception::TencentCloudSDKException, "InvalidCredential, #{key} should not be none or empty"
        end
        raise TencentCloudSDKException("InvalidCredential, #{key} should not contain spaces") if value.strip != value

        true
      end
    end
  end
end
