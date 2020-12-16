# frozen_string_literal: true

require 'bundler/setup'
require 'tencent_cloud'
require 'tencent_cloud/ocr/v20181119/ocr_client'
# replace secret_id secret_key
secret_id = 'SECRET_ID'
secret_key = 'SECRET_KEY'
credential = TencentCloud::Common::Credential.new(secret_id, secret_key)
payload = {
  'ImageUrl' => 'IMAGE URL'
}
resp = TencentCloud::OcrClient.new(credential, 'ap-beijing').business_card_ocr(payload)
pp JSON.parse(resp.body)
