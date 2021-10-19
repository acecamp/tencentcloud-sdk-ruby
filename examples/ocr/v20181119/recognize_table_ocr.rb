# frozen_string_literal: true

require 'bundler/setup'
require 'tencent_cloud'
require 'tencent_cloud/ocr/v20181119/ocr_client'
# replace secret_id secret_key
secret_id = ENV['TENCENT_SECRET_ID']
secret_key = ENV['TENCENT_SECRET_KEY']
credential = TencentCloud::Common::Credential.new(secret_id, secret_key)
payload = {
  'ImageUrl' => '',
  'IsPdf' => true
}
resp = TencentCloud::OcrClient.new(credential, 'ap-beijing').recognize_table_ocr(payload)
pp JSON.parse(resp.body)
