class Greet < Jobly::Job
  def execute(name: 'there')
    # :nocov:
    puts "Hi #{name}!"
    # :nocov:
  end
end
