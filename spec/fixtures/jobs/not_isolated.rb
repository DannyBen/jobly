class NotIsolatedJob < Jobly::Job
  def execute
    puts Dir.pwd
  end
end
