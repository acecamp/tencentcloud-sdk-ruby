# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tencent_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = 'tencentcloud-sdk-ruby'
  spec.version       = TencentCloud::VERSION
  spec.authors       = ['FengCe']
  spec.email         = ['kalelfc@gmail.com']

  spec.summary       = '腾讯云开发者工具套件（SDK）3.0，SDK3.0是云 API3.0 平台的配套工具'
  spec.description   = '方便 Ruby 开发者调试和接入腾讯云产品 API，并提供首次使用开发工具包的简单示例，快速获取腾讯云 Ruby SDK 并开始调用。'
  spec.homepage      = 'https://github.com/acecamp/tencentcloud-sdk-ruby'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/acecamp/tencentcloud-sdk-ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/acecamp/agora-education-web-demo/blob/master/CHANGELOG.txt'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry', '~> 0.1'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_runtime_dependency 'typhoeus', '~> 1.0'
end
