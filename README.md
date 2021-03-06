# TencentCloud
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tencentcloud-sdk-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tencentcloud-sdk-ruby

## Usage

```ruby
require 'tencent_cloud/ocr/v20181119/ocr_client'
credential = TencentCloud::Common::Credential.new(SECRET_ID, SECRET_KEY)
payload = {
  'ImageUrl' => 'IMAGE URL'
}
resp = TencentCloud::OcrClient.new(credential, 'ap-beijing').business_card_ocr(payload)
pp JSON.parse(resp.body)
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TencentCloud project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tencent_cloud/blob/master/CODE_OF_CONDUCT.md).
