module Jobly
  class Job
    include Sidekiq::Worker
    include Sidekiq::Status::Worker
    sidekiq_options retry: 5

    def perform(params={})
      params = params.to_h.transform_keys(&:to_sym)
      params.empty? ? execute : execute(params)
    end

    def execute(params={})
      raise NotImplementedError
    end
  end
end
