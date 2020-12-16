# frozen_string_literal: true

require 'tencent_cloud/common/base_client'
module TencentCloud
  class TmsClient < Common::BaseClient
    API_VERSION = '2020-07-13'
    ENDPOINT = 'tms.tencentcloudapi.com'
    SERVICE_NAME = 'tms'
    APIS = {
      #################### 文本内容审核相关接口
      ## 账号举报接口
      ## https://cloud.tencent.com/document/api/1124/47690
      account_tipoff_access: 'AccountTipoffAccess',

      ## 识别统计
      ## https://cloud.tencent.com/document/api/1124/51003
      describe_text_stat: 'DescribeTextStat',

      ## 获取用户词库列表
      ## https://cloud.tencent.com/document/api/1124/51004
      describe_text_lib: 'DescribeTextLib',

      ## 文本内容安全
      ## https://cloud.tencent.com/document/api/1124/46976
      text_moderation: 'TextModeration',
    }
  end
end