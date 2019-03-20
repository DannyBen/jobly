module Jobly
  module Commands
    class WorkerCmd < Base
      summary "Start a job worker"
      usage "jobly worker [-c COUNT -C PATH (-q NAME)...]"
      usage "jobly worker (-h|--help)"
      option "-c --concurrency COUNT", "Number of parallel jobs [default: 4]"
      option "-C --config PATH", "Specify a path to a YAML config file. The provided path should be relative to the global config_path directory and without the yml extension"
      option "-q --queue NAME[,WEIGHT]", "Specify one or more queues that this worker should handle"

      example "jobly worker --concurrency 10"
      example "jobly worker -q critical -q default -q low"
      example "jobly worker --config primary"

      def run
        say "Starting sidekiq"
        exec "sidekiq #{options_from_args}"
      end

    private

      def options_from_args
        result = []
        result << "--environment #{Jobly.environment}"
        result << "--require \"#{boot_file}\""
        result << "--concurrency #{args['--concurrency']}" if args['--concurrency']

        if args['--config']
          config_file = "#{Jobly.config_path}/#{args['--config']}.yml"
          raise ArgumentError, "Config not found: #{config_file}" unless File.exist? config_file
          result << "--config \"#{config_file}\""
        end
        
        args['--queue'].each { |q| result << "--queue #{q}" }

        result.join ' '
      end

      def boot_file
        @boot_file ||= File.expand_path '../boot.rb', __dir__
      end
    end
  end
end
