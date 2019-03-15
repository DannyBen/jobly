require 'remote_syslog_logger'
require 'uri'

module Jobly
  module Log
    def self.new(target = nil)
      if !target or target.to_sym == :stdout or target == STDOUT
        return Logger.new STDOUT
      end

      unless target.start_with? 'syslog://'
        return Logger.new target
      end

      uri = URI target
      RemoteSyslogLogger.new (uri.host || 'localhost'), (uri.port || 514), 
        local_hostname: uri.user, program: uri.password
    end
  end
end



