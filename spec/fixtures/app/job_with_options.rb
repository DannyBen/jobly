class JobWithoptions < Jobly::Job
  class << self
    def default_options
      solo
      isolated
      retries 2
    end
  end
end
