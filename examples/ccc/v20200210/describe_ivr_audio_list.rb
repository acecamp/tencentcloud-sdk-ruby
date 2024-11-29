# frozen_string_literal: true

require 'bundler/setup'
require 'tencent_cloud'
require 'tencent_cloud/ccc/v20200210/ccc_client'

secret_id = ENV['TENCENT_SECRET_ID']
secret_key = ENV['TENCENT_SECRET_KEY']
payload = {
  "StartTimeStamp" => Time.now.to_i - 3600 * 24,
  "EndTimeStamp" => Time.now.to_i,
  "PageSize" => 10,
  "PageNumber" => 0
}

credential = TencentCloud::Common::Credential.new(secret_id, secret_key)
resp = TencentCloud::CccClient.new(credential).describe_tel_cdr(payload)
pp JSON.parse(resp.body)
