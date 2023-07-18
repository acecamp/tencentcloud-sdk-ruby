# frozen_string_literal: true

require 'tencent_cloud/common/base_client'
module TencentCloud
  class NlpClient < Common::BaseClient
    API_VERSION = '2019-04-08'
    ENDPOINT = 'nlp.tencentcloudapi.com'
    SERVICE_NAME = 'nlp'
    APIS = {
      #################### 自然语言处理 > 词法分析相关接口
      # 词法分析
      # https://cloud.tencent.com/document/api/271/35494
      lexical_analysis: 'LexicalAnalysis',

      # 相似词
      # https://cloud.tencent.com/document/api/271/35493
      similar_words: 'SimilarWords',

      #################### 自然语言处理 > 篇章分析相关接口
      # 自动摘要
      # https://cloud.tencent.com/document/api/271/35499
      auto_summarization: 'AutoSummarization',

      # 情感分析
      # https://cloud.tencent.com/document/api/271/35497
      sentiment_analysis: 'SentimentAnalysis',

      # 关键词提取
      # https://cloud.tencent.com/document/api/271/35498
      keywords_extraction: 'KeywordsExtraction',

      # 文本分类
      # https://cloud.tencent.com/document/api/271/35496
      text_classification: 'TextClassification',

      # 词法分析V2
      # https://cloud.tencent.com/document/product/271/90611
      parse_words: 'ParseWords'
    }.freeze
  end
end
