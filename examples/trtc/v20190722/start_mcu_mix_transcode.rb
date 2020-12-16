# frozen_string_literal: true

require 'bundler/setup'
require 'tencent_cloud'
require 'tencent_cloud/trtc/v20190722/trtc_client'
# replace secret_id secret_key
secret_id = 'SECRET_ID'
secret_key = 'SECRET_KEY'
credential = TencentCloud::Common::Credential.new(secret_id, secret_key)

payload = {
  # replace SdkAppId
  "SdkAppId": 'SDKAPPID',
  "RoomId": 1,
  "OutputParams": {
    "StreamId": 's12'
  },
  "EncodeParams": {
    "VideoWidth": 1280,
    "VideoHeight": 720,
    "VideoBitrate": 1560,
    "VideoFramerate": 2,
    "VideoGop": 2,
    "BackgroundColor": 0,
    "AudioSampleRate": 48_000,
    "AudioBitrate": 64,
    "AudioChannels": 2
  },
  "LayoutParams": {
    "Template": 0
  }
}
resp = TencentCloud::TrtcClient.new(credential, 'ap-guangzhou').start_mcu_mix_transcode(payload)
pp JSON.parse(resp.body)
