How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.

This example illustrates setting the job options: `backtrace`, `queue` and 
`retries`.


```shell
cd examples/options-and-errors

# Start the server and the worker
foreman start

# Or one by one
jobly server
jobly worker --queue critical

# From another terminal, send the job to the owrker
jobly send Deploy

# View the failed job and its backtrace in the Retries tab
open http://localhost:3000/retries
```