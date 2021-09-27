# frozen_string_literal: true

require 'bundler/setup'
require 'tencent_cloud'
require 'tencent_cloud/tms/v20200713/tms_client'
require 'base64'
# replace secret_id secret_key
secret_id = ENV['TENCENT_SECRET_ID']
secret_key = ENV['TENCENT_SECRET_KEY']
credential = TencentCloud::Common::Credential.new(secret_id, secret_key)
str = Base64.encode64('
  北京时间12月16日，在马刺对阵火箭的比赛中，马刺遗憾输掉比赛。不过马刺也不是没有惊喜，他们的首轮秀瓦塞尔继续有精彩表现，全场打了31分钟，拿到了11分4板4抢断，8投4中的命中率。虽然球队输球，但是瓦塞尔的表现不错，不仅进攻端表现出色，面对哈登也不胆怯，哈登全场10投3中，被成功防死，瓦塞尔功不可没。
  ')

payload = {
  'Content': str
}
resp = TencentCloud::TmsClient.new(credential, 'ap-hongkong').text_moderation(payload)
pp JSON.parse(resp.body)
