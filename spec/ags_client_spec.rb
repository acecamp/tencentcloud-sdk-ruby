# frozen_string_literal: true

require 'spec_helper'
require 'tencent_cloud/ags/v20250920/ags_client'

RSpec.describe TencentCloud::AgsClient do
  subject(:client) do
    credential = TencentCloud::Common::Credential.new('secret-id', 'secret-key')
    described_class.new(credential, 'ap-beijing')
  end

  it 'routes sandbox API methods to their documented actions' do
    expect(client).to receive(:get_response).with('CreateSandboxTool', {}).ordered
    expect(client).to receive(:get_response).with('DeleteSandboxTool', {}).ordered
    expect(client).to receive(:get_response).with('DescribeSandboxToolList', {}).ordered
    expect(client).to receive(:get_response).with('UpdateSandboxTool', {}).ordered
    expect(client).to receive(:get_response).with('AcquireSandboxInstanceToken', {}).ordered
    expect(client).to receive(:get_response).with('DescribeSandboxInstanceList', {}).ordered
    expect(client).to receive(:get_response).with('PauseSandboxInstance', {}).ordered
    expect(client).to receive(:get_response).with('ResumeSandboxInstance', {}).ordered
    expect(client).to receive(:get_response).with('StartSandboxInstance', {}).ordered
    expect(client).to receive(:get_response).with('StopSandboxInstance', {}).ordered
    expect(client).to receive(:get_response).with('UpdateSandboxInstance', {}).ordered

    client.create_sandbox_tool({})
    client.delete_sandbox_tool({})
    client.describe_sandbox_tool_list({})
    client.update_sandbox_tool({})
    client.acquire_sandbox_instance_token({})
    client.describe_sandbox_instance_list({})
    client.pause_sandbox_instance({})
    client.resume_sandbox_instance({})
    client.start_sandbox_instance({})
    client.stop_sandbox_instance({})
    client.update_sandbox_instance({})
  end
end