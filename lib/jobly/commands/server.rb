module Jobly
  module Commands
    class ServerCmd < Base
      summary "Start the server"
      usage "jobly server [--port NUMBER --bind IP --daemonize]"
      usage "jobly server stop"
      usage "jobly server (-h|--help)"
      option "-b, --bind IP", "Set the listen address [default: 0.0.0.0]"
      option "-p, --port NUMBER", "Set the port number [default: 3000]"
      option "-d, --daemonize", "Run in the background"
      command "stop", "Stop a previously started daemonized server"
      example "jobly server -d"
      example "jobly server --port 4567 --daemonize"
      example "jobly server stop"

      def run
        port = args['--port']
        host = args['--bind']
        options = ''
        
        message = "Starting server"
        if args['--daemonize']
          options = "--daemonize --pid server.pid"
          message += " in the background\n"
          message += "Use !txtpur!jobly server stop!txtrst! to terminate"
        end
        say message

        exec "rackup --env #{Jobly.environment} --port #{port} --host #{host} #{options} #{rackup_file}"
      end

      def stop_command
        if File.exist? 'server.pid'
          pid = File.read 'server.pid'
          Process.kill 'INT', pid.to_i
        else
          say "!txtred!Cannot find pid file server.pid"
        end
      end

    private

      def rackup_file
        @rackup_file ||= File.expand_path '../config.ru', __dir__
      end
    end
  end
end
