module Jobly
  module Commands
    class WorkerCmd < Base
      summary "Start a job worker"
      usage "jobly worker [--concurrency COUNT]"
      usage "jobly worker (-h|--help)"
      option "-c, --concurrency COUNT", "Number of parallel jobs [default: 4]"

      def run
        concurrency = args['--concurrency']
        say "Starting sidekiq"
        exec "sidekiq --environment #{Jobly.environment} --concurrency #{concurrency} --require #{boot_file}"
      end

    private

      def boot_file
        @boot_file ||= File.expand_path '../boot.rb', __dir__
      end
    end
  end
end
