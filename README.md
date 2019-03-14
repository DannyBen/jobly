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
  <td width='50%'><a target='_screenshot' href='/demo/terminal.gif'><img src='/demo/terminal.gif'/></a></td>
  <td width='50%'><a target='_screenshot' href='/demo/screen.gif'><img src='/demo/screen.gif'/></a></td>
</tr></table>

---

Follow development progress:  
[![Waffle.io - Columns and their card count](https://badge.waffle.io/DannyBen/jobly.svg?columns=all&style=flat-square)](https://waffle.io/DannyBen/jobly)

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

Visit the [Jobly Documentation][1].


[1]: https://jobly.dannyb.co
[2]: https://github.com/dannyben/docker-jobly