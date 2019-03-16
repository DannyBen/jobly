require 'stringio'
require 'http'

module SpecMixin
  def require_mock_server!
    response = HTTP.get('http://localhost:3000/')
    response = response.parse
    raise "Please start the mock server (something else is running on port 3000)" unless response['mockserver'] == 'online'
  rescue HTTP::ConnectionError
    # :nocov:
    raise "Please start the mock server"
    # :nocov:
  end
end