module Jobly
  class Error < StandardError; end
  class JobNotFound < Error; end
  class InfoFileNotFound < Error; end
  class HTTPError < Error; end
end
