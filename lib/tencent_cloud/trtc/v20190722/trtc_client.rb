# frozen_string_literal: true

require 'tencent_cloud/common/base_client'
module TencentCloud
  class TrtcClient < Common::BaseClient
    API_VERSION = '2019-07-22'
    ENDPOINT = 'trtc.tencentcloudapi.com'
    SERVICE_NAME = 'trtc'
    APIS = {
      #################### 混流转码相关接口
      ## 启动云端混流
      ## https://cloud.tencent.com/document/api/647/44270
      start_mcu_mix_transcode: 'StartMCUMixTranscode',

      ## 结束云端混流
      ## https://cloud.tencent.com/document/api/647/44269
      stop_mcu_mix_transcode: 'StopMCUMixTranscode',

      #################### 通话质量监控相关接口
      ## 创建异常信息
      ## https://cloud.tencent.com/document/api/647/44683
      create_trouble_info: 'CreateTroubleInfo',

      ## 查询异常体验事件
      ## https://cloud.tencent.com/document/api/647/45712
      describe_abnormal_event: 'DescribeAbnormalEvent',

      ## 查询详细事件
      ## https://cloud.tencent.com/document/api/647/44864
      describe_detail_event: 'DescribeDetailEvent',

      ## DescribeRoomInformation 查询房间列表
      ## https://cloud.tencent.com/document/api/647/44050
      describe_room_information: 'DescribeRoomInformation',

      ## 查询用户列表与通话指标
      ## https://cloud.tencent.com/document/api/647/44054
      describe_call_detail: 'DescribeCallDetail',

      ## 查询历史房间和用户数
      ## https://cloud.tencent.com/document/api/647/44165
      describe_history_scale: 'DescribeHistoryScale',

      ## 查询实时规模
      ## https://cloud.tencent.com/document/api/647/44051
      describe_realtime_scale: 'DescribeRealtimeScale',

      ## 查询实时质量数据
      ## https://cloud.tencent.com/document/api/647/44052
      describe_realtime_query: 'DescribeRealtimeQuality',

      ## 查询实时网络状态
      ## https://cloud.tencent.com/document/api/647/44053
      describe_realtime_network: 'DescribeRealtimeNetwork',

      #################### 房间管理相关接口
      ## 解散房间
      ## https://cloud.tencent.com/document/api/647/37088
      dissmiss_room: 'DissmissRoom',
      ## 移出用户
      ## https://cloud.tencent.com/document/api/647/40496
      remove_user: 'RemoveUser',
    }.freeze
  end
end
