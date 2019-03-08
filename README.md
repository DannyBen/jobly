Jobly
==================================================

[![Gem Version](https://badge.fury.io/rb/jobly.svg)](https://badge.fury.io/rb/jobly)
[![Build Status](https://travis-ci.com/DannyBen/jobly.svg?branch=master)](https://travis-ci.com/DannyBen/jobly)

---

Compact job server with API, CLI, Web UI and a Sidekiq heart.

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

Getting Started
--------------------------------------------------

TODO


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
