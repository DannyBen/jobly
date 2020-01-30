<div align='center'>

<img src='/assets/logo.svg' width=300>

Jobly
==================================================

Compact job server with API, CLI, Web UI and a Sidekiq heart.

[![Gem Version](https://badge.fury.io/rb/jobly.svg)](https://badge.fury.io/rb/jobly)
[![Build Status](https://github.com/DannyBen/jobly/workflows/Test/badge.svg)](https://github.com/DannyBen/jobly/actions?query=workflow%3ATest)
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

Or with the official [Jobly docker image][docker].


What's in the Box
--------------------------------------------------

Jobly is a command line utility that wraps several goodies around the 
sidekiq backgronud jobs system. It includes the following components:

- **Command line interface** - for starting the server, starting the worker, 
  and for running jobs.
- **Web API** - for executing jobs.
- **Web Dashboard** - including job progress and status.
- **Remote Syslog Support** - send output to Papertrail or remote syslog.
- **Slack Notifications** - report job progress to Slack.


Documentation
--------------------------------------------------

- Visit the [Jobly documentation][docs].
- Visit the [interactive demo on Katacoda][katacoda].


Contributing / Support
--------------------------------------------------

If you experience any issue, have a question or a suggestion, or if you wish
to contribute, feel free to [open an issue][issues].

---

[docs]: https://jobly.dannyb.co
[docker]: https://github.com/dannyben/docker-jobly
[katacoda]: https://www.katacoda.com/dannyb/scenarios/jobly
[issues]: https://github.com/DannyBen/jobly/issues
