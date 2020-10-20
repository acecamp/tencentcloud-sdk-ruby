# frozen_string_literal: true

require 'tencent_cloud/common/base_client'
module TencentCloud
  class OcrClient < Common::BaseClient
    API_VERSION = '2018-11-19'
    ENDPOINT = 'ocr.tencentcloudapi.com'
    SERVICE_NAME = 'ocr'
    APIS = {
      ####################
      ## 通用印刷体识别
      ## https://cloud.tencent.com/document/api/866/33526
      general_basic_ocr: 'GeneralBasicOCR',

      ## 通用印刷体识别（高精度版）
      ## https://cloud.tencent.com/document/api/866/34937
      general_accurate_ocr: 'GeneralAccurateOCR',

      ## 通用印刷体识别（精简版）
      ## https://cloud.tencent.com/document/api/866/37831
      general_efficient_ocr: 'GeneralEfficientOCR',

      ## 通用印刷体识别（高速版）
      ## https://cloud.tencent.com/document/api/866/33525
      general_fast_ocr: 'GeneralFastOCR',

      ## 英文识别
      ## https://cloud.tencent.com/document/api/866/34938
      english_ocr: 'EnglishOCR',

      ## 通用手写体识别
      ## https://cloud.tencent.com/document/api/866/36212
      general_handwriting_ocr: 'GeneralHandwritingOCR',

      ## 快速文本检测
      ## https://cloud.tencent.com/document/api/866/37830
      text_detect: 'TextDetect',

      #################### 卡证文字识别相关接口
      ## 身份证识别
      ## https://cloud.tencent.com/document/api/866/33524
      id_card_ocr: 'IDCardOCR',

      ## 中国香港身份证识别
      ## https://cloud.tencent.com/document/api/866/46919
      hk_id_card_ocr: 'HKIDCardOCR',

      ## 智能卡证分类
      ## https://cloud.tencent.com/document/api/866/46770
      classify_detect_ocr: 'ClassifyDetectOCR',

      ## 名片识别
      ## https://cloud.tencent.com/document/api/866/36214
      business_card_ocr: 'BusinessCardOCR',
    }.freeze
  end
end
