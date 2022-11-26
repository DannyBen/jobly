# Job can inherits from your custom Job class (app/job.rb) or from Jobly::Job
class Hello < Job
  def execute(name: 'Bob')
    total 2

    at 0, 'Initializing'
    sleep rand 3.0..8.0

    at 1, 'Preparing to say Hi'
    sleep rand 3.0..8.0

    logger.info "Hi #{name}!"

    at 2, 'Done'
  end
end
