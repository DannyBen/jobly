class OptionsJob < Jobly::Job
  queue 'are-as-tea'
  backtrace 11
  retries 3
  solo
  isolated

  def execute
    puts "options: #{options}"
    puts "isolated: #{isolated?}"
    puts "solo: #{solo?}"
  end
end
