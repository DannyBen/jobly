How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.

This example demonstrates how to call a job from inside another job.

Two approaches are possible:

1. Executing secondary jobs synchronously, as part of the parent job.
2. Spawning the secondary jobs to be executed later by the worker, as 
   separate jobs.


```shell
cd examples/job-in-job

# Start the server and worker
foreman start

# From another terminal, send the jobs to the owrker
jobly send RunSync count:20
jobly send RunAsync count:10
```