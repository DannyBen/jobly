class Ping < Jobly::Job
  def execute(response: 'PONG')
    at 100, response
    logger.info response
  end
end
