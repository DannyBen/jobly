module Jobly
  module Jobs
    def self.get_class(job)
      Object.const_get namespaced_job(job) rescue nil
    end

    def self.get_class!(job)
      Object.const_get namespaced_job(job)
    rescue NameError
      raise JobNotFound, job
    end

    def self.load_all
      Dir["#{Jobly.full_app_path}/**/*.rb"].each { |file| require file }
      Dir["#{Jobly.full_jobs_path}/**/*.rb"].each { |file| require file }
    end

    def self.namespaced_job(job)
      if Jobly.jobs_namespace
        "#{Jobly.jobs_namespace}::#{job}"
      else
        job
      end
    end
  end
end

