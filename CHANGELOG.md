Change Log
========================================

Untagged - Latest
----------------------------------------

- Update dependencies
- Drop support for Ruby 3.0
- Load most of the Jobly code using autoloading


v1.0.1 - 2023-07-28
----------------------------------------

- Allow specifying bind address in jobly server command


v1.0.0 - 2023-04-25
----------------------------------------

- Upgrade to Sidekiq 7
- Drop support for Ruby 2.7


v0.5.13 - 2023-02-08
----------------------------------------

- Upgrade dependencies


v0.5.12 - 2023-01-20
----------------------------------------

- Loosen dependency requirements


v0.5.11 - 2023-01-16
----------------------------------------

- Upgrade to Sidekiq 7
- Drop support for Ruby 2.6
- Revert to sidekiq 6
- Update dependencies


v0.5.10 - 2022-10-23
----------------------------------------

- Update Sinatra to ~> 3.0
- Allow puma 6


v0.5.9 - 2021-09-30
----------------------------------------

- Update http gem to ~> 5.0 and sidekiq-status to ~> 2.0
- Add configuration for rack cookie secret


v0.5.8 - 2021-04-25
----------------------------------------

- Updated init templates
- Fix rack session error caused by new sidekiq


v0.5.7 - 2020-12-22
----------------------------------------

- Fix broken remove button by adding 'use Rack::MethodOverride'


v0.5.6 - 2020-12-03
----------------------------------------

- Update puma to 5.1


<!-- break v0.5.4 -->
## [v0.5.4](https://github.com/DannyBen/jobly/tree/v0.5.4) (2020-05-07)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.5.3...v0.5.4)

**Merged pull requests:**

- Fix ruby 2.7 compatibility [\#77](https://github.com/DannyBen/jobly/pull/77) ([DannyBen](https://github.com/DannyBen))
- Test with GitHub Actions [\#76](https://github.com/DannyBen/jobly/pull/76) ([DannyBen](https://github.com/DannyBen))

## [v0.5.3](https://github.com/DannyBen/jobly/tree/v0.5.3) (2020-01-17)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.5.2...v0.5.3)

**Closed issues:**

- Rack::File deprecation warning [\#70](https://github.com/DannyBen/jobly/issues/70)

**Merged pull requests:**

- Upgrade Sting so that we have ExtendedYAML [\#74](https://github.com/DannyBen/jobly/pull/74) ([DannyBen](https://github.com/DannyBen))
- Fix ruby warnings when running with -w [\#73](https://github.com/DannyBen/jobly/pull/73) ([DannyBen](https://github.com/DannyBen))

## [v0.5.2](https://github.com/DannyBen/jobly/tree/v0.5.2) (2020-01-11)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.5.1...v0.5.2)

**Merged pull requests:**

- Restrict rack version due to deprecation [\#71](https://github.com/DannyBen/jobly/pull/71) ([DannyBen](https://github.com/DannyBen))
- Test with ruby 2.7 [\#66](https://github.com/DannyBen/jobly/pull/66) ([DannyBen](https://github.com/DannyBen))

## [v0.5.1](https://github.com/DannyBen/jobly/tree/v0.5.1) (2020-01-05)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.5.0...v0.5.1)

**Merged pull requests:**

- Option improvements [\#69](https://github.com/DannyBen/jobly/pull/69) ([DannyBen](https://github.com/DannyBen))

## [v0.5.0](https://github.com/DannyBen/jobly/tree/v0.5.0) (2020-01-04)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.4.6...v0.5.0)

**Breaking changes:**

- Add isolation and change perform\_async to run\_later [\#68](https://github.com/DannyBen/jobly/pull/68) ([DannyBen](https://github.com/DannyBen))

**Merged pull requests:**

- Fix Job::execute to call before/after actions [\#67](https://github.com/DannyBen/jobly/pull/67) ([DannyBen](https://github.com/DannyBen))

## [v0.4.6](https://github.com/DannyBen/jobly/tree/v0.4.6) (2020-01-01)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.4.5...v0.4.6)

**Implemented enhancements:**

- Improve app loading sequence [\#64](https://github.com/DannyBen/jobly/issues/64)
- Expose JOBLY\_SHELL\_DRY\_RUN as a config value [\#63](https://github.com/DannyBen/jobly/issues/63)

**Merged pull requests:**

- Improve app boot [\#65](https://github.com/DannyBen/jobly/pull/65) ([DannyBen](https://github.com/DannyBen))

## [v0.4.5](https://github.com/DannyBen/jobly/tree/v0.4.5) (2019-12-30)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.4.4...v0.4.5)

**Implemented enhancements:**

- Job Index [\#43](https://github.com/DannyBen/jobly/issues/43)

**Merged pull requests:**

- Fix relative paths issues and add Jobly.log\_level [\#62](https://github.com/DannyBen/jobly/pull/62) ([DannyBen](https://github.com/DannyBen))

## [v0.4.4](https://github.com/DannyBen/jobly/tree/v0.4.4) (2019-12-27)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.4.3...v0.4.4)

**Implemented enhancements:**

- Can we support GitHub webhooks out of the box? [\#8](https://github.com/DannyBen/jobly/issues/8)

**Merged pull requests:**

- Add workspace info command [\#61](https://github.com/DannyBen/jobly/pull/61) ([DannyBen](https://github.com/DannyBen))

## [v0.4.3](https://github.com/DannyBen/jobly/tree/v0.4.3) (2019-12-26)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.4.2...v0.4.3)

**Merged pull requests:**

- Add JOBLY\_SHELL\_DRY\_RUN [\#60](https://github.com/DannyBen/jobly/pull/60) ([DannyBen](https://github.com/DannyBen))

## [v0.4.2](https://github.com/DannyBen/jobly/tree/v0.4.2) (2019-12-25)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.4.1...v0.4.2)

**Implemented enhancements:**

- Add Settings mixin [\#58](https://github.com/DannyBen/jobly/issues/58)
- Refactor helpers [\#57](https://github.com/DannyBen/jobly/issues/57)

**Merged pull requests:**

- Helpers improvements [\#59](https://github.com/DannyBen/jobly/pull/59) ([DannyBen](https://github.com/DannyBen))

## [v0.4.1](https://github.com/DannyBen/jobly/tree/v0.4.1) (2019-12-24)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.4.0...v0.4.1)

**Merged pull requests:**

- Provide logger as a loadable module [\#56](https://github.com/DannyBen/jobly/pull/56) ([DannyBen](https://github.com/DannyBen))

## [v0.4.0](https://github.com/DannyBen/jobly/tree/v0.4.0) (2019-11-07)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.3.0...v0.4.0)

**Fixed bugs:**

- Jobly.logger does not work properly [\#53](https://github.com/DannyBen/jobly/issues/53)
- Version 0.3.0 breaks logging [\#51](https://github.com/DannyBen/jobly/issues/51)

**Merged pull requests:**

- Fix custom logger [\#54](https://github.com/DannyBen/jobly/pull/54) ([DannyBen](https://github.com/DannyBen))
- Fix logging [\#52](https://github.com/DannyBen/jobly/pull/52) ([DannyBen](https://github.com/DannyBen))

## [v0.3.0](https://github.com/DannyBen/jobly/tree/v0.3.0) (2019-11-06)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.2.7...v0.3.0)

**Merged pull requests:**

- Update dependencies [\#50](https://github.com/DannyBen/jobly/pull/50) ([DannyBen](https://github.com/DannyBen))
- Test with Ruby 2.6 [\#49](https://github.com/DannyBen/jobly/pull/49) ([DannyBen](https://github.com/DannyBen))
- Fix logger assignment [\#48](https://github.com/DannyBen/jobly/pull/48) ([DannyBen](https://github.com/DannyBen))

## [v0.2.7](https://github.com/DannyBen/jobly/tree/v0.2.7) (2019-04-16)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.2.6...v0.2.7)

**Merged pull requests:**

- Fix cli arg:value-with-colon [\#47](https://github.com/DannyBen/jobly/pull/47) ([DannyBen](https://github.com/DannyBen))

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

## [v0.1.1](https://github.com/DannyBen/jobly/tree/v0.1.1) (2019-03-09)

[Full Changelog](https://github.com/DannyBen/jobly/compare/v0.1.0...v0.1.1)

**Merged pull requests:**

- Allow calling namespaced jobs with slashes [\#1](https://github.com/DannyBen/jobly/pull/1) ([DannyBen](https://github.com/DannyBen))

## [v0.1.0](https://github.com/DannyBen/jobly/tree/v0.1.0) (2019-03-08)

[Full Changelog](https://github.com/DannyBen/jobly/compare/e7daf315b0023aa2d966dae25e7d373d87cfc60c...v0.1.0)
