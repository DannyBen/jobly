require 'jobly/module_functions'
require 'jobly/jobs'
require 'jobly/version'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/custom_logger'

module Jobly
  class API < Sinatra::Application
    helpers Sinatra::CustomLogger
    using ConvertToTyped

    configure :development, :production do
      set :server, :puma
      set :logger, Log.new(Jobly.log, :sinatra) if Jobly.log
    end

    configure :development do
      register Sinatra::Reloader
    end

    before do
      content_type 'application/json'
    end

    get '/' do
      {
        version: Jobly::VERSION,
        message: %["I'm gonna live till I die" - Frank Sinatra],
      }.to_json + "\n"
    end

    get '/*' do
      job = params[:splat].first
      params.delete :splat
      add_job job, params
    end

    post '/*' do
      job = params[:splat].first
      params.delete :splat
      add_job job, params
    end

  private

    def add_job(job, args = {})
      job_class = Jobs.get_class job

      unless job_class
        response = {
          status:  'error',
          message: 'No such job',
          job:     job,
          params:  args,
        }

        status 404
        logger.debug "[jobly server] No such job (#{job})"
        return response.to_json
      end

      args = args.convert_to_typed
      if args.empty?
        job_class.run_later
      else
        job_class.run_later args
      end

      response = {
        status: 'received',
        job:    job,
        params: args,
      }

      logger.debug "[jobly server] Job received (#{job})"
      "#{response.to_json}\n"
    end
  end
end
