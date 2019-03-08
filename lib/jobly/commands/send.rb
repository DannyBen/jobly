require 'http'

module Jobly
  module Commands
    class SendCmd < Base
      using ArgumentConverters

      summary "Send a job to the API"
      usage "jobly send JOB [PARAMS...]"
      usage "jobly send (-h|--help)"
      param "JOB", "Job name"
      param "PARAMS", "Parameters to pass to the job as key:value"
      example "jobly send Greet name:Bob"
      example "jobly send Deploy env:stage branch:master"

      def run
        job = args['JOB']
        params = args['PARAMS'].to_params
        url = "#{Jobly.api_base}/#{job}"

        response = if params.empty?
          HTTP.get url
        else
          HTTP.get url, params: params
        end

        if response.code != 200
          say "!txtred!#{response.code}"
        else
          say "!txtgrn!200 OK"
        end
        
        lp response.parse
      end

    end
  end
end
