# This job will spawn child threads for the sub jobs.
# Each of the spawned jobs will have its own progress bar in the dashboard.

class RunAsync < Jobly::Job
  def execute(count: 10)
    count.times do |i|
      SubJob.execute_async number: i
    end
  end
end
