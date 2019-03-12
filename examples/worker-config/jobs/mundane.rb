class Mundane < Jobly::Job
  options queue: 'mundane'

  def execute
    logger.info "Running a mundane job"
  end
end
