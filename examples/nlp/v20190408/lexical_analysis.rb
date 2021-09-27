# frozen_string_literal: true

require 'bundler/setup'
require 'tencent_cloud'
require 'tencent_cloud/nlp/v20190408/nlp_client'
# replace secret_id secret_key
secret_id = ENV['TENCENT_SECRET_ID']
secret_key = ENV['TENCENT_SECRET_KEY']
credential = TencentCloud::Common::Credential.new(secret_id, secret_key)
payload = {
  'Text' => '阿森纳俱乐部的成立则晚于热刺4年。它最早成立的地方并不是伦敦北部，而是伦敦东南部的戴尔广场的皇家兵工厂地带。它最早的名字叫做皇家阿森纳队。
  1891年，这支球队才完成了职业化改革，成为了职业俱乐部，球队名称更名为：“伍尔维奇阿森纳”(Woolwich Arsenal)。加入乙级联赛（当时英格兰最高赛事是英甲）。
  阿森纳和热刺的矛盾是在1913年的那次搬迁。1910年，亨利-诺里斯爵士成为了伍尔维奇-阿森纳的最大股东，而这个诺里斯爵士在当时还有个身份——富勒姆主席。',
  'Flag' => 2
}
resp = TencentCloud::NlpClient.new(credential, 'ap-guangzhou').lexical_analysis(payload)
pp JSON.parse(resp.body)
