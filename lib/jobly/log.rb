require 'remote_syslog_logger'
require 'uri'

module Jobly
  module Log
    class << self
      def new(target = nil, tag = nil)
        if !target || (target.to_sym == :stdout) || (target == $stdout)
          return Logger.new $stdout
        end

        target = target.to_s
        target %= tag if tag && target.include?('%s')

        if target.start_with? 'syslog://'
          remote_syslog_logger target
        else
          Logger.new File.expand_path(target, Jobly.root)
        end
      end

    private

      def remote_syslog_logger(target)
        uri = URI target
        RemoteSyslogLogger.new (uri.host || 'localhost'), (uri.port || 514),
          local_hostname: uri.user, program: uri.password
      end
    end
  end
end
