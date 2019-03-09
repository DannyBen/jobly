class Hello < Jobly::Job
  def execute(name: 'bob')
    puts "Hello #{name}"
    logger.info "said hello to #{name}"
  end
end
