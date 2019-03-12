require 'remote_syslog_logger'

Jobly.configure do |config|

  # Configure syslog parameters
  syslog_host = ENV['SYSLOG_HOST'] || "127.0.0.1"
  syslog_port = ENV['SYSLOG_PORT'] || '514'
  sysname, program = 'my-host', 'my-app'

  # Set the Jobly logger to syslog
  config.logger = RemoteSyslogLogger.new syslog_host, syslog_port, 
    local_hostname: sysname, program: program

  config.logger.level = Logger::INFO

end