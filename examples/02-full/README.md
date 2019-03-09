How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.

This example illustrates these aspects of Jobly:

1. How to use foreman to start both the server and the worker together in 
   development environment - see the Procfile.
2. How to configure Jobly - see the config folder.
3. How to add additional code that is preloaded - see the app folder.
4. How to create your own Job parent class to provide common functionality
   to your jobs.
5. How to execute shell commands from a Job and send the output directly
   to the logger.
6. How to send all output to a file log instead of STDOUT.


```shell
cd examples/02-full

# Install additional gem dependencies
bundle install

# Start both the server and the worker
foreman start

# Visit the server
open http://localhost:3000

# From another terminal, send jobs from the command line to the API
jobly send Build deploy:yes
jobly send Build deploy:no

# Or send a job via curl
curl localhost:3000/do/Build?deploy=no

# View the log
cat jobly.log
```