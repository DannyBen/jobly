<div align='center'>

<img src='/assets/logo.svg' width=300>

Jobly
==================================================

Compact job server with API, CLI, Web UI and a Sidekiq heart.

[![Gem Version](https://badge.fury.io/rb/jobly.svg)](https://badge.fury.io/rb/jobly)
[![Build Status](https://travis-ci.com/DannyBen/jobly.svg?branch=master)](https://travis-ci.com/DannyBen/jobly)
[![Maintainability](https://api.codeclimate.com/v1/badges/b3932ebd153d831583e2/maintainability)](https://codeclimate.com/github/DannyBen/jobly/maintainability)

</div>

---

* [Installation](#installation)
* [What's in the Box](#whats-in-the-box)
* [Quick Start](#quick-start)
* [Usage](#usage)
    * [Server](#server)
    * [Worker](#worker)
    * [Running jobs from the command line](#running-jobs-from-the-command-line)
    * [Running jobs through the API](#running-jobs-through-the-api)
* [Building Jobs](#building-jobs)
    * [The Job Class](#the-job-class)
* [Loading Additional Code](#loading-additional-code)
* [Configuration](#configuration)
    * [Worker Configuration](#worker-configuration)

---

Installation
--------------------------------------------------

    $ gem install jobly



What's in the Box
--------------------------------------------------

Jobly is a command line utility that wraps several goodies around the 
sidekiq backgronud jobs system. It includes the following components:

- **Command line interface** - for starting the server, starting the worker, 
  and for running jobs.
- **Web API** - for executing jobs.
- **Web Dashboard** - including job progress and status.



Quick Start
--------------------------------------------------

Follow one of these annotated [examples](/examples).



Usage
--------------------------------------------------


### Server

To start the server run `jobly server` and open <http://localhost:3000/> 
in your browser.

This will start a webserver with two primary entrypoints:

- `/` (root) - a dashboard for your background job processes.
- `/do/JobName?param=value` - an API for executing jobs


### Worker

To start processing jobs, run `jobly worker`


### Running jobs from the command line

There are three ways to run a job from the command line:

Run the job locally, without going through any of the background job 
processing chain:

    $ jobly run JobName param:value


Run the job locally, but wait for a worker to process it.

    $ jobly run --later JobName param:value


Send a job through the API (either localhost or remote).

    $ jobly send JobName param:value


### Running jobs through the API

The API supports running jobs either by GET or by POST in the following URL
structure:

<http://localhost:3000/do/JobName>

Using GET:

```
$ curl localhost:3000/do/Build?deploy=no
# => {"status":"received","job":"Build","params":{"deploy":"no"}}
```

Using POST:

```
$ curl -XPOST localhost:3000/do/Build -d deploy=yes
{"status":"received","job":"Build","params":{"deploy":"yes"}}
```


Building Jobs
--------------------------------------------------

To build a jobs "workspace", start in an empty folder and create a `./jobs` 
subfolder inside it. All your job classes go in this folder (configurable).

All job classes will be loaded by any of Jobly's commands.


### The Job Class

A job class is a simple Ruby class inheriting from 
[`Jobly::Job`](/lib/jobly/job.rb).

The only requirement is that your class implements an `execute` method that
optionally accepts keyword arguments (recommended), or a hash.

Example:

```ruby
class Hello < Jobly::Job
  def execute(name: 'bob')
    puts "Hello #{name}"
    logger.info "said hello to #{name}"
  end
end
```

Note that these classes are simply Jobly-flavored sidekiq jobs, with these
key differences:

- You need to implement `execute` instead of `perform`
- Job arguments are defined as keyword arguments, instead of positional 
  arguments.

#### Job Options

Setting job options can be done like this:

```ruby
class Deploy < Jobly::Job
  queue 'critical'
  backtrace 10
  retries 3
  
  def execute
    puts "Deploying"
  end
end
```

| Key         | Default   | Purpose       |
|-------------|-----------|---------------|
| `queue`     | `default` | set the name of the queue for this job. |
| `retries`   |  `5`      | number of times to retry on failure. |
| `backtrace` |  `5`      | number of backtrace lines to show in case of failures. Can be `true`, `false` or a number of lines to save. |


Loading Additional Code
--------------------------------------------------

In case your jobs require additional functionality, you may create the 
`./app` folder as a sibling to the `./jobs` folder (configurable).

Any ruby files in this folder (and subfolders) will be autmatically loaded
and available to your jobs.


Configuration
--------------------------------------------------

Configuring Jobly can be done by one of two methods:

1. Setting environment variables.
2. Adding a `./config/jobly.rb` file.

See this [example config file](/examples/02-full/config/jobly.rb) for a full
annotated configuration example and a list of options with their respective
environment variables.


### Worker Configuration

For advanced configuration of the sidekiq worker, beyond what the 
`jobly worker` command provides, you can place YAML files in the config 
folder and point the workers to their config file with
`jobly worker --config name`.

These files are simply [sidekiq configuration files][1].

See the [worker-config](/examples/06-worker-config) example for more 
information.


[1]: https://github.com/mperham/sidekiq/wiki/Advanced-Options
