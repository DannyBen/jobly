module Jobly
  module Commands
    class RunCmd < Base
      using ArgumentConverters
      using ConvertToTyped

      summary "Run a job locally"
      usage "jobly run [--later] JOB [PARAMS...]"
      usage "jobly run (-h|--help)"
      option "-l, --later", "Schedule the job to be executed later by a worker instead of running it immediately"
      param "JOB", "Job name"
      param "PARAMS", "Parameters to pass to the job as key:value"
      example "jobly run Greet name:Bob"
      example "jobly run --later Greet name:Bob"
      example "jobly run Deploy env:stage branch:master"

      def run
        job = args['JOB']
        params = args['PARAMS'].to_params.convert_to_typed
        job_class = Jobs.get_class! job

        if args['--later']
          say "Scheduling !txtgrn!#{job_class}"
          if params.empty?
            job_class.perform_async
          else
            job_class.perform_async params
          end
        
        else
          say "Running !txtgrn!#{job_class}"
          job_class.new.perform params
        end
      end

    end
  end
end
