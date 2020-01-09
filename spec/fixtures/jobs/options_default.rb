class OptionsDefaultJob < Jobly::Job
  def execute
    puts "options: #{options}"
    puts "isolated: #{isolated?}"
    puts "solo: #{solo?}"
  end
end
