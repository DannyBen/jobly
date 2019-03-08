module Jobs
  class Build < Jobly::Job
    def execute
      # total 3
      # at 0, "Building"

      system "something that breaks" or raise "It broke!"
      system "docker --version" or raise "Problems!"

    end
  end
end