How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.


```shell
cd examples/01-minimal

# Run the job locally and immediately
jobly run Hello

# Start the worker
jobly worker

# From another terminal, send the job to the owrker
jobly run --later Hello name:Jimmy

# Start the API / Dashboard server then visit http://localhost:3000
jobly server

# From another terminal, send the job from the command line to the API
jobly send Hello

# Schedule a job by accessing the API:
open http://localhost:3000/do/Hello?name=Guest
```