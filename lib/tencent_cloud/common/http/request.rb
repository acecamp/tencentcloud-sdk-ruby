# frozen_string_literal: true

module TencentCloud
  module Common
    module Http
      class Request
        attr_accessor :klass, :options, :credential

        def initialize(credential, klass, options = {})
          @uri = 'https://' + klass::ENDPOINT
          options[:method] ||= :post
          self.options = options
          self.credential = credential
          self.klass = klass
        end

        def signed_request
          headers = {
            'content-type' => 'application/json; charset=utf-8',
            'host' => klass::ENDPOINT
          }
          if options[:headers].nil?
            options[:headers] = headers
          else
            options[:headers].merge! headers
          end

          request = Typhoeus::Request.new @uri.to_s, options
          authorization = Sign.new(credential, klass, request).sign_tc3
          request.options[:headers]['Authorization'] = authorization
          request
        end

        def run
          signed_request.run
        end
      end
    end
  end
end
