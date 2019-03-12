How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.

This example makes use of worker configuration file in order to tell the 
worker to process two queues (`critical` and `mundane`) instead of the 
`default` queue.

Note that the same can also be achieved through the command line, without
using a config file.

```shell
cd examples/worker-config

# Start the server and worker
# Note that the `Procfile` is defined to run `jobly worker --config worker`
# which points the worker to the `config/worker.yml` configuration file
foreman start

# From another terminal, send the jobs to the owrker
jobly send Critical
jobly send Mundane
```