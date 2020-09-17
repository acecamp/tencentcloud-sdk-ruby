# frozen_string_literal: true

require 'bundler/setup'
require 'tencent_cloud'
require 'tencent_cloud/trtc/v20190722/trtc_client'
# replace secret_id secret_key
secret_id = 'SECRET_ID'
secret_key = 'SECRET_KEY'
credential = TencentCloud::Common::Credential.new(secret_id, secret_key)
payload = {
  'SdkAppId' => 'SDKAPPID',
  'StartTime' => Time.now.to_i - 24 * 3600,
  'EndTime' => Time.now.to_i
}
resp = TencentCloud::TrtcClient.new(credential).describe_room_information(payload)
puts resp.body
