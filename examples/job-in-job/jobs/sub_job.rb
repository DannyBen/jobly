class SubJob < Jobly::Job
  def execute(number:)
    logger.info "Executing... something... #{number}"
    sleep rand(1..5)
  end
end
