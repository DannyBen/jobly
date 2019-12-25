# :nocov: (covered by external bin_spec)
class JobThatErrors < Jobly::Job
  def execute
    greet
  end

  def greet(name)
    puts "hello #{name}"
  end
end
