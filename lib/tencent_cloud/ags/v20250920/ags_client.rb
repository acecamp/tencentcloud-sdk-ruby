# frozen_string_literal: true

require 'tencent_cloud/common/base_client'

module TencentCloud
  class AgsClient < Common::BaseClient
    API_VERSION = '2025-09-20'
    ENDPOINT = 'ags.tencentcloudapi.com'
    SERVICE_NAME = 'ags'
    APIS = {
      # 沙箱工具相关接口
      # https://cloud.tencent.com/document/api/1814/124812
      create_sandbox_tool: 'CreateSandboxTool',
      # https://cloud.tencent.com/document/api/1814/124811
      delete_sandbox_tool: 'DeleteSandboxTool',
      # https://cloud.tencent.com/document/api/1814/124810
      describe_sandbox_tool_list: 'DescribeSandboxToolList',
      # https://cloud.tencent.com/document/api/1814/124809
      update_sandbox_tool: 'UpdateSandboxTool',

      # 沙箱实例相关接口
      # https://cloud.tencent.com/document/api/1814/124818
      acquire_sandbox_instance_token: 'AcquireSandboxInstanceToken',
      # https://cloud.tencent.com/document/api/1814/124817
      describe_sandbox_instance_list: 'DescribeSandboxInstanceList',
      # https://cloud.tencent.com/document/api/1814/127876
      pause_sandbox_instance: 'PauseSandboxInstance',
      # https://cloud.tencent.com/document/api/1814/127875
      resume_sandbox_instance: 'ResumeSandboxInstance',
      # https://cloud.tencent.com/document/api/1814/124816
      start_sandbox_instance: 'StartSandboxInstance',
      # https://cloud.tencent.com/document/api/1814/124815
      stop_sandbox_instance: 'StopSandboxInstance',
      # https://cloud.tencent.com/document/api/1814/124814
      update_sandbox_instance: 'UpdateSandboxInstance'
    }.freeze
  end
end