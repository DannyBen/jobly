class OptionsInheritJob < JobWithoptions
  default_options

  def execute
    puts "options: #{options}"
    puts "isolated: #{isolated?}"
    puts "solo: #{solo?}"
  end
end
