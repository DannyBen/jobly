require 'remote_syslog_logger'
require 'uri'

module Jobly
  module Log
    def self.new(target = nil, tag = nil)
      if !target or target.to_sym == :stdout or target == STDOUT
        return Logger.new STDOUT
      end

      target = target.to_s
      target %= tag if tag and target.include? "%s"

      if target.start_with? 'syslog://'
        remote_syslog_logger target
      else
        Logger.new target
      end
    end

  private

    def self.remote_syslog_logger(target)
      uri = URI target
      RemoteSyslogLogger.new (uri.host || 'localhost'), (uri.port || 514), 
        local_hostname: uri.user, program: uri.password
    end
  end
end



