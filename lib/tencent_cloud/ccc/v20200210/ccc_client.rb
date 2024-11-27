# frozen_string_literal: true

require 'tencent_cloud/common/base_client'
module TencentCloud
  class CccClient < Common::BaseClient
    API_VERSION = '2020-02-10'
    ENDPOINT = 'ccc.tencentcloudapi.com'
    SERVICE_NAME = 'ccc'
    APIS = {

      # 创建AI会话
      # https://cloud.tencent.com/document/api/679/111211
      create_ai_call: 'CreateAICall'
    }.freeze
  end
end
