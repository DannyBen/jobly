class Sleep < Jobly::Job
  before { puts "brush teeth before sleeping for #{params[:this_many]} hours" }
  after  { puts "get coffee after #{params[:this_many]} hours sleep" }

  def execute(this_many:)
    puts "Sleeping for #{this_many} hours"
  end
end
