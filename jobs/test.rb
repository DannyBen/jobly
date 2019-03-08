module Jobs
  class Test < Jobly::Job
    def execute(duration: 2)
      total 3

      at 0, "Building"
      sleep duration

      at 1, "Testing"
      sleep duration

      at 2, "Deploying"
      sleep duration

      at 3, "Deployed HELLO"
      puts "Done"
    end
  end
end