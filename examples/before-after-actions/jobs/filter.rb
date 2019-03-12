class Filter < Jobly::Job
  before do
    puts "before"
    skip_job
  end

  after do
    puts "after"
  end

  on_skip    { puts "on_skip" }
  on_success { puts "on_success" }
  on_failure { puts "on_failure" }

  def execute
    puts "execute"
  end
end
