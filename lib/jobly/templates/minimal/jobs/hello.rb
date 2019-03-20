class Hello < Jobly::Job
  def execute(name: 'Bob')
    puts "Hello #{name}"
    logger.info "Said hello to #{name}"
  end
end
