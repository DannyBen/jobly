How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.

This example demonstrates how to use Jobly inside a docker container and 
with docker compose.

```shell
cd examples/docker-compose

# Build the images
docker-compose build

# Start the server and the worker
docker-compose up web worker

# Visit your server
open http://localhost:3000

# Send a test job
docker-compose run send

# ... or with parameters
docker-compose run send Hello name:Bobby
```