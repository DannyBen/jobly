require 'stringio'
require 'http'

class StringIO
  def wait_readable(*)
    # :nocov:
    true
    # :nocov:
  end

  def ioctl(*)
    80
  end
end

module SpecMixin
  def require_mock_server!
    response = HTTP.get('http://localhost:3000/')
    raise "Please start the mock server (got #{response.code} #{response.reason})" unless response.status.ok?

    response = response.parse
    raise 'Please start the mock server (something else is running on port 3000)' unless response['mockserver'] == 'online'
  rescue HTTP::ConnectionError
    # :nocov:
    raise 'Please start the mock server'
    # :nocov:
  end
end
