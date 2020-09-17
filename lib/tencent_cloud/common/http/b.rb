# frozen_string_literal: true

require 'typhoeus'
# request = ''
secret_id = 'AKIDEuxrtAIO3HIiXlIdJ688tOIiFB10PgGK'
secret_key = 'km1drRhJpo4g97VWDgcGIzLRqtex8KJu'
credential = TencentCloud::Common::Credential.new(secret_id, secret_key)
payload = {
  'SdkAppId' => '1400426713',
  'StartTime' => Time.now.to_i - 24 * 3600,
  'EndTime' => Time.now.to_i
}
require 'tencent_cloud/trtc/v20190722/trtc_client'
TencentCloud::TrtcClient.new(credential).describe_room_information(payload)

payload = {
  "SdkAppId": 111,
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
TencentCloud::TrtcClient.new(credential).start_mcu_mix_transcode(payload).body

# klass = TencentCloud::TrtcClient
# body = {"Limit": 1, "Filters": [{"Values": ["未命名"], "Name": "instance-name"}]}
# request = Typhoeus::Request.new "https:// + #{klass::EndPoint}", method: :post, body: '{"Limit": 1, "Filters": [{"Values": ["\u672a\u547d\u540d"], "Name": "instance-name"}]}'

# r = TencentCloud::Common::Http::Request.new credential,TencentCloud::TrtcClient, body: body
# r.signed_request()
# TencentCloud::TrtcClient.new(credential).describe_room_information()
