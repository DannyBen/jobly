How to use this example
==================================================

[Download the examples folder](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/DannyBen/jobly/tree/master/examples)
and follow the steps below.

This example illustrates how to define jobs that are namespaced in modules.

It illustrates:

1. How all jobs can be nested inside a specific module that is used as the
   default namespace for all jobs - see the config folder.
2. How additional namespacing is done by putting some jobs under a nested
   module and (optionally, by convention) putting them inside a subfolder - 
   see the jobs folder.

```shell
cd examples/namespaces

# Run the namespaced job that is found in the root namespace `Jobs`
jobly run Hello

# Run the nested job that is found in the root namespace `Jobs::Inner`
jobly run Inner::Hi
```
