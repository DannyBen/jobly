How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.

This example illustrates the use of `before`, `after`, `on_skip`, 
`on_success`, and `on_failure` blocks.

```shell
cd examples/before-after-actions

# Run the job in its successful form
jobly run Actions

# Run the job in its failed form
jobly run Actions fail:yes

# Run the filter job (will not execute the job body)
jobly run Filter
```