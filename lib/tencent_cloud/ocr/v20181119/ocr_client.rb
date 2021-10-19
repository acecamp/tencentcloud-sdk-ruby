# frozen_string_literal: true

require 'tencent_cloud/common/base_client'
module TencentCloud
  class OcrClient < Common::BaseClient
    API_VERSION = '2018-11-19'
    ENDPOINT = 'ocr.tencentcloudapi.com'
    SERVICE_NAME = 'ocr'
    APIS = {
      #################### 通用文字识别相关接口
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

      #################### 票据单据识别相关接口
      ## 运单识别
      ## https://cloud.tencent.com/document/api/866/34934
      waybill_ocr: 'WaybillOCR',

      ## 增值税发票识别
      ## https://cloud.tencent.com/document/api/866/36210
      vat_invoice_ocr: 'VatInvoiceOCR',

      ## 火车票识别
      ## https://cloud.tencent.com/document/api/866/37071
      train_ticket_ocr: 'TrainTicketOCR',

      ## 出租车发票识别
      ## https://cloud.tencent.com/document/api/866/37072
      taxi_invoice_ocr: 'TaxiInvoiceOCR',

      ## 定额发票识别
      ## https://cloud.tencent.com/document/api/866/37073
      quora_invoice_ocr: 'QuotaInvoiceOCR',

      ## 机票行程单识别
      ## https://cloud.tencent.com/document/api/866/37075
      flight_invoice_ocr: 'FlightInvoiceOCR',

      ## 购车发票识别
      ## https://cloud.tencent.com/document/api/866/37076
      car_invoice_ocr: 'CarInvoiceOCR',

      ## 增值税发票（卷票）识别
      ## https://cloud.tencent.com/document/api/866/37832
      vat_roll_invoice_ocr: 'VatRollInvoiceOCR',

      ## 过路过桥费发票识别
      ## https://cloud.tencent.com/document/api/866/37833
      toll_invoice_ocr: 'TollInvoiceOCR',

      ## 轮船票识别
      ## https://cloud.tencent.com/document/api/866/37834
      ship_invoice_ocr: 'ShipInvoiceOCR',

      ## 混贴票据识别
      ## https://cloud.tencent.com/document/api/866/37835
      mix_invoice_ocr: 'MixedInvoiceOCR',

      ## 混贴票据分类
      ## https://cloud.tencent.com/document/api/866/37836
      mix_invoice_detect: 'MixedInvoiceDetect',

      ## 通用机打发票识别
      ## https://cloud.tencent.com/document/api/866/37837
      invoice_general_ocr: 'InvoiceGeneralOCR',

      ## 汽车票识别
      ## https://cloud.tencent.com/document/api/866/37838
      bus_invoice_ocr: 'BusInvoiceOCR',

      ## 完税证明识别
      ## https://cloud.tencent.com/document/api/866/37839
      duty_paid_proof_ocr: 'DutyPaidProofOCR',

      ## 金融票据切片识别
      ## https://cloud.tencent.com/document/api/866/38295
      finan_bill_slice_ocr: 'FinanBillSliceOCR',

      ## 金融票据整单识别
      ## https://cloud.tencent.com/document/api/866/38296
      finan_bill_ocr: 'FinanBillOCR',

      #################### 行业文档识别相关接口
      ## 表格识别（V2)
      ## https://cloud.tencent.com/document/product/866/49525
      recognize_table_ocr: 'RecognizeTableOCR'
    }.freeze
  end
end
