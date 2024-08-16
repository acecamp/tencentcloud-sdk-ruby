# frozen_string_literal: true

require 'bundler/setup'
require 'tencent_cloud'
require 'tencent_cloud/lke/v20231130/lke_client'
# replace secret_id secret_key
secret_id = ENV['TENCENT_SECRET_ID']
secret_key = ENV['TENCENT_SECRET_KEY']
credential = TencentCloud::Common::Credential.new(secret_id, secret_key)
payload = {
  'FileUrl' => '',
  'FileStartPageNumber' => 1,
  'FileEndPageNumber' => 10,
  'Config' => {
    'EnableInsetImage' => true
  }
}
resp = TencentCloud::LkeClient.new(credential, 'ap-guangzhou').reconstruct_document(payload)
pp JSON.parse(resp.body)
