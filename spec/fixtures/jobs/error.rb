class JobThatErrors < Jobly::Job
  def execute
    greet
  end

  def greet(name)
    puts "hello #{name}"
  end
end
