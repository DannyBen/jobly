class Actions < Jobly::Job
  before { puts "before" }
  after  { puts "after" }

  on_success { puts "on_success" }
  on_failure { puts "on_failure" }

  after :after_party

  def execute(fail: false)
    puts "execute 1/2"
    raise "RAISED" if fail
    puts "execute 2/2"
  end

  def after_party
    puts "after_party"
  end
end
