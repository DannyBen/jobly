class OptionsJob < Jobly::Job
  queue 'are-as-tea'
  backtrace 11
  retries 3

  def execute
    puts "executed with these options:"
    p sidekiq_options_hash
  end
end
