How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.

This example illustrates how to configure Jobly to send all logger events 
to a local or remote syslog.

```shell
cd examples/syslog

# Install additional gem dependencies
bundle install

# Start watching the syslog
sudo tail -f /var/log/syslog

# Start both the server and the worker
foreman start

# Send jobs from the command line to the API
jobly send Hello
```
