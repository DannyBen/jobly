class Deploy < Jobly::Job
  # This job runs on the 'critical' queue
  queue 'critical'

  # On failure, show 5 backtrace lines in the web UI
  backtrace 5

  # On failure, retry once only
  retries 1

  def execute(env: 'stage')
    puts "Deploying to #{env}"
    raise "Something went wrong..."
  end
end
