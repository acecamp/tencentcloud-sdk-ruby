# frozen_string_literal: true

require 'tencent_cloud/common/base_client'
module TencentCloud
  class LkeClient < Common::BaseClient
    API_VERSION = '2023-11-30'
    ENDPOINT = 'lke.tencentcloudapi.com'
    SERVICE_NAME = 'lke'
    APIS = {
      #################### 大模型知识引擎 > 文档解析
      # 词法分析
      # https://cloud.tencent.com/document/product/1759/107504
      reconstruct_document: 'ReconstructDocument',
    }.freeze
  end
end
