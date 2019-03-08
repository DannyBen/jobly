module Jobs
  class Hi < Jobly::Job
    def execute(name: 'bob')
      puts "hi #{name}"
    end
  end
end