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

        response = client.get(*args)

        raise HTTPError, "#{response.code} #{response.reason}" unless response.status.ok?

        say "!txtgrn!#{response.code} #{response.reason}"
        puts response.parse.to_yaml
      end

    private

      def client
        @client ||= client!
      end

      def client!
        if Jobly.auth
          user, pass = Jobly.auth.split ':'
          HTTP.basic_auth user: user, pass: pass
        else
          HTTP
        end
      end

    end
  end
end
