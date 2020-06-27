# frozen_string_literal: true

load 'vendor/bundle/bundler/setup.rb'
$LOAD_PATH.unshift(File.expand_path('lib', __dir__))

require 'json'

# rubocop:disable Lint/UnusedMethodArgument
def hello(event:, context:)
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
end
# rubocop:enable Lint/UnusedMethodArgument
