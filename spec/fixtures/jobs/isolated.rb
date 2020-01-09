class IsolatedJob < Jobly::Job
  isolated

  def execute
    puts Dir.pwd
  end
end
