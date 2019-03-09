class Build < Job
  def execute(app: 'server', deploy: 'yes')
    # Define how many steps this job has, for the progress bar in the 
    # Statuses tab
    total 3

    # Specify that we are at step 0, with a message for the progress bar.
    at 0, "Building"

    # Simulate a long running command with output to the logger.
    shell.run 'ls -la ; sleep 10'
    
    # Simulate some more long running commands
    if deploy == 'yes'
      at 1, "Deploying"
      sleep 10
    end

    at 2, "Verifying"
    sleep 10

    at 3, "Deployed"
  end
end
