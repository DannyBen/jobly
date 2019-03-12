class Critical < Jobly::Job
  options queue: 'critical'

  def execute
    logger.info "Running a critical job"
  end
end
