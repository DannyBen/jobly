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

<table><tr>
  <td width='50%'><a target='_screenshot' href='/assets/terminal.gif'><img src='/assets/terminal.gif'/></a></td>
  <td width='50%'><a target='_screenshot' href='/assets/screen.gif'><img src='/assets/screen.gif'/></a></td>
</tr></table>

---

Installation
--------------------------------------------------

    $ gem install jobly

Or with the official [Jobly docker image][2].


What's in the Box
--------------------------------------------------

Jobly is a command line utility that wraps several goodies around the 
sidekiq backgronud jobs system. It includes the following components:

- **Command line interface** - for starting the server, starting the worker, 
  and for running jobs.
- **Web API** - for executing jobs.
- **Web Dashboard** - including job progress and status.



Documentation
--------------------------------------------------

- Visit the [Jobly documentation][1].
- Visit the [interactive demo on Katacoda][3].


[1]: https://jobly.dannyb.co
[2]: https://github.com/dannyben/docker-jobly
[3]: https://www.katacoda.com/dannyb/scenarios/jobly
