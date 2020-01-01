module Jobly
  module Jobs
    def self.get_class(job)
      Object.const_get full_job_name(job) rescue nil
    end

    def self.get_class!(job)
      Object.const_get full_job_name(job)
    rescue NameError
      raise JobNotFound, job
    end

    def self.load_all
      user_bootfile = "#{Jobly.full_app_path}/boot.rb"
      require user_bootfile if File.exist? user_bootfile
      Dir["#{Jobly.full_app_path}/**/*.rb"].sort.each { |file| require file }
      Dir["#{Jobly.full_jobs_path}/**/*.rb"].sort.each { |file| require file }
    end

    def self.full_job_name(job)
      job = job.gsub '/', '::'
      if Jobly.jobs_namespace
        "#{Jobly.jobs_namespace}::#{job}"
      else
        job
      end
    end
  end
end

