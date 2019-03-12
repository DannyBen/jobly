# This job will call the other jobs synchronously and display progress
# in the dashboard

class RunSync < Jobly::Job
  def execute(count: 10)
    total count

    count.times do |i|
      at i
      puts "Executing Job ##{i}"
      SubJob.execute number: i
    end

    at count, "Done"
  end
end
