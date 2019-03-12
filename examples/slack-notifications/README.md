How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.

This example illustrates how to send slack notifications from your jobs.

```shell
cd examples/slack-notifications

# Install additional gem dependencies
bundle install

# Set your slack webhook in an environment variable
export SLACK_WEBHOOK=https://hooks.slack.com/services/...

# Run the job
jobly run Greet
```