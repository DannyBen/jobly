# Change Log

## [v0.2.6](https://github.com/DannyBen/jobly/tree/v0.2.6) (2019-03-22)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.2.5...v0.2.6)

**Implemented enhancements:**

- Do not show empty config keys in `jobly config` [\#42](https://github.com/DannyBen/jobly/issues/42)
- Consider including `run` with `TTY::Command` in `Jobly::Job` [\#32](https://github.com/DannyBen/jobly/issues/32)
- Add built in slack notification support [\#46](https://github.com/DannyBen/jobly/pull/46) ([DannyBen](https://github.com/DannyBen))

**Merged pull requests:**

- Add Job\#run and Job\#shell [\#45](https://github.com/DannyBen/jobly/pull/45) ([DannyBen](https://github.com/DannyBen))
- Do not display empty config values [\#44](https://github.com/DannyBen/jobly/pull/44) ([DannyBen](https://github.com/DannyBen))

## [v0.2.5](https://github.com/DannyBen/jobly/tree/v0.2.5) (2019-03-20)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.2.4...v0.2.5)

**Merged pull requests:**

- Fix missing template files [\#41](https://github.com/DannyBen/jobly/pull/41) ([DannyBen](https://github.com/DannyBen))

## [v0.2.4](https://github.com/DannyBen/jobly/tree/v0.2.4) (2019-03-20)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.2.3...v0.2.4)

**Implemented enhancements:**

- Add option to run both server and worker in the background [\#34](https://github.com/DannyBen/jobly/issues/34)
- Consider adding `jobly scaffold` command [\#7](https://github.com/DannyBen/jobly/issues/7)

**Fixed bugs:**

- API JSON response should have a new line at the end [\#36](https://github.com/DannyBen/jobly/issues/36)
- API root endpoint does not recognize VERSION [\#35](https://github.com/DannyBen/jobly/issues/35)

**Merged pull requests:**

- Add scaffolder command [\#40](https://github.com/DannyBen/jobly/pull/40) ([DannyBen](https://github.com/DannyBen))
- Add support for ruby 2.3 and 2.4 [\#39](https://github.com/DannyBen/jobly/pull/39) ([DannyBen](https://github.com/DannyBen))
- Fix version confusion and add newline after jsons [\#37](https://github.com/DannyBen/jobly/pull/37) ([DannyBen](https://github.com/DannyBen))

## [v0.2.3](https://github.com/DannyBen/jobly/tree/v0.2.3) (2019-03-18)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.2.2...v0.2.3)

**Merged pull requests:**

- Add auto-tagging loggers [\#33](https://github.com/DannyBen/jobly/pull/33) ([DannyBen](https://github.com/DannyBen))

## [v0.2.2](https://github.com/DannyBen/jobly/tree/v0.2.2) (2019-03-16)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.2.1...v0.2.2)

**Implemented enhancements:**

- Consider adding basic auth support [\#30](https://github.com/DannyBen/jobly/issues/30)
- Can we add mountable point for external Rack applications? [\#9](https://github.com/DannyBen/jobly/issues/9)

**Merged pull requests:**

- Add Basic Auth support [\#31](https://github.com/DannyBen/jobly/pull/31) ([DannyBen](https://github.com/DannyBen))
- Add ability to add custom rack apps [\#29](https://github.com/DannyBen/jobly/pull/29) ([DannyBen](https://github.com/DannyBen))
- Improve CLI error catching [\#28](https://github.com/DannyBen/jobly/pull/28) ([DannyBen](https://github.com/DannyBen))

## [v0.2.1](https://github.com/DannyBen/jobly/tree/v0.2.1) (2019-03-15)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.2.0...v0.2.1)

**Implemented enhancements:**

- Consider adding built in remote syslog support [\#19](https://github.com/DannyBen/jobly/issues/19)

**Merged pull requests:**

- Add log wrapper for easy syslogging [\#27](https://github.com/DannyBen/jobly/pull/27) ([DannyBen](https://github.com/DannyBen))

## [v0.2.0](https://github.com/DannyBen/jobly/tree/v0.2.0) (2019-03-15)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.1.3...v0.2.0)

**Implemented enhancements:**

- Consider making more settings available by environment variables [\#20](https://github.com/DannyBen/jobly/issues/20)
- Add support for unique \(solo\) jobs [\#4](https://github.com/DannyBen/jobly/issues/4)

**Closed issues:**

- Complete Solo Jobs documentation [\#26](https://github.com/DannyBen/jobly/issues/26)
- Create an official docker image [\#24](https://github.com/DannyBen/jobly/issues/24)
- Allow escaping from `before` block [\#22](https://github.com/DannyBen/jobly/issues/22)
- Complete documentation on GitBook [\#10](https://github.com/DannyBen/jobly/issues/10)

**Merged pull requests:**

- Add solo jobs [\#25](https://github.com/DannyBen/jobly/pull/25) ([DannyBen](https://github.com/DannyBen))
- Add ability to skip job from before block [\#23](https://github.com/DannyBen/jobly/pull/23) ([DannyBen](https://github.com/DannyBen))
- Allow more config through env vars [\#21](https://github.com/DannyBen/jobly/pull/21) ([DannyBen](https://github.com/DannyBen))

## [v0.1.3](https://github.com/DannyBen/jobly/tree/v0.1.3) (2019-03-12)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.1.2...v0.1.3)

**Closed issues:**

- Add slack notification example [\#17](https://github.com/DannyBen/jobly/issues/17)
- Complete test coverage [\#16](https://github.com/DannyBen/jobly/issues/16)
- Update documentation for Actions [\#15](https://github.com/DannyBen/jobly/issues/15)
- Should the `after` block run on job failure? [\#12](https://github.com/DannyBen/jobly/issues/12)
- Add examples for options and for before/after blocks [\#6](https://github.com/DannyBen/jobly/issues/6)
- Add screenshot to README [\#5](https://github.com/DannyBen/jobly/issues/5)

**Merged pull requests:**

- Add and rename examples [\#18](https://github.com/DannyBen/jobly/pull/18) ([DannyBen](https://github.com/DannyBen))
- Improve before/after/on\_success/on\_failure job actions [\#14](https://github.com/DannyBen/jobly/pull/14) ([DannyBen](https://github.com/DannyBen))
- Add trailer [\#11](https://github.com/DannyBen/jobly/pull/11) ([DannyBen](https://github.com/DannyBen))
- Add job extensions [\#3](https://github.com/DannyBen/jobly/pull/3) ([DannyBen](https://github.com/DannyBen))
- Add job in job example [\#2](https://github.com/DannyBen/jobly/pull/2) ([DannyBen](https://github.com/DannyBen))

## [v0.1.2](https://github.com/DannyBen/jobly/tree/v0.1.2) (2019-03-09)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.1.1...v0.1.2)

**Merged pull requests:**

- Allow calling namespaced jobs with slashes [\#1](https://github.com/DannyBen/jobly/pull/1) ([DannyBen](https://github.com/DannyBen))

## [v0.1.1](https://github.com/DannyBen/jobly/tree/v0.1.1) (2019-03-09)
[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.1.0...v0.1.1)

## [v0.1.0](https://github.com/DannyBen/jobly/tree/v0.1.0) (2019-03-08)


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*