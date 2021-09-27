# frozen_string_literal: true

require 'bundler/setup'
require 'tencent_cloud'
require 'tencent_cloud/trtc/v20190722/trtc_client'
# replace secret_id secret_key
secret_id = ENV['TENCENT_SECRET_ID']
secret_key = ENV['TENCENT_SECRET_KEY']
credential = TencentCloud::Common::Credential.new(secret_id, secret_key)
payload = {
  'SdkAppId' => 'SDKAPPID',
  'StartTime' => Time.now.to_i - 24 * 3600,
  'EndTime' => Time.now.to_i
}
resp = TencentCloud::TrtcClient.new(credential, 'ap-guangzhou').describe_room_information(payload)
pp JSON.parse(resp.body)