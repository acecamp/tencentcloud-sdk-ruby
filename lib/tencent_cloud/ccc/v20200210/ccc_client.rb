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
      create_ai_call: 'CreateAICall',

      # 获取音频文件
      # https://cloud.tencent.com/document/api/679/104895
      describe_ivr_audio_list: 'DescribeIvrAudioList',

      # 获取电话服务记录与录音
      # https://cloud.tencent.com/document/api/679/47714
      describe_tel_cdr: 'DescribeTelCdr'
    }.freeze
  end
end
