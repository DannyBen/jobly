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
        url = "#{Jobly.api_url}/#{job}"

        args = [url]
        args << { params: params } unless params.empty?

        response = client.get *args

        if response.code == 200
          say "!txtgrn!200 OK"
        else
          say "!txtred!#{response.code}"
        end
        
        lp response.parse
      end

    private

      def client
        @client ||= HTTP.basic_auth user: "user", pass: "pass"
      end

    end
  end
end
