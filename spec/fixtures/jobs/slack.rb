class SlackJob < Jobly::Job
  slack_channel '#spec'
  slack_user 'RSpec'

  def execute
  end
end
