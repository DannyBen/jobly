module Jobly
  module Commands
    class ServerCmd < Base
      summary 'Start the server'
      usage 'jobly server [--host HOST] [--port NUMBER]'
      usage 'jobly server (-h|--help)'
      option '-o --host HOST', 'Set the bind address [default: 0.0.0.0]'
      option '-p --port NUMBER', 'Set the port number [default: 3000]'

      def run
        host = args['--host']
        port = args['--port']
        say 'Starting server'
        exec 'rackup', '--env', Jobly.environment, '--port', port, '--host', host, rackup_file
      end

    private

      def rackup_file
        @rackup_file ||= File.expand_path '../config.ru', __dir__
      end
    end
  end
end
