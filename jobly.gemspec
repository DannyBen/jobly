lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'
require 'jobly/version'

Gem::Specification.new do |s|
  s.name        = 'jobly'
  s.version     = Jobly::VERSION
  s.date        = Date.today.to_s
  s.summary     = "Compact job server with API, CLI, Web UI and a Sidekiq heart"
  s.description = "Execute background jobs and build tasks on this sidekiq-based job server"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*']
  s.executables = ['jobly']
  s.homepage    = 'https://jobly.dannyb.co/'
  s.metadata = {
    "bug_tracker_uri"   => "https://github.com/dannyben/jobly/issues",
    "changelog_uri"     => "https://github.com/DannyBen/jobly/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://jobly.dannyb.co/",
    "source_code_uri"   => "https://github.com/dannyben/jobly",
  }
  s.license     = 'MIT'
  s.required_ruby_version = ">= 2.5.0"

  s.add_runtime_dependency "http", '~> 4.0'
  s.add_runtime_dependency "pretty_trace", '~> 0.2', '>= 0.2.4'
  s.add_runtime_dependency "puma", '~> 4.2'
  # Restrict Rack version due to deprecation warning in Sidekiq that needs
  # to be addressed:
  # https://github.com/mperham/sidekiq/issues/4423
  s.add_runtime_dependency "rack", '~> 2.0', '< 2.1.0'
  s.add_runtime_dependency "remote_syslog_logger", '~> 1.0'
  s.add_runtime_dependency "requires", '~> 0.1'
  s.add_runtime_dependency "sidekiq", '~> 6.0'
  s.add_runtime_dependency "sidekiq-status", '~> 1.1'
  s.add_runtime_dependency "sinatra", '~> 2.0'
  s.add_runtime_dependency "sinatra-contrib", '~> 2.0'
  s.add_runtime_dependency "slack-notifier", '~> 2.3'
  s.add_runtime_dependency "sting", '~> 0.4'
  s.add_runtime_dependency "tty-command", '~> 0.9'
  s.add_runtime_dependency "tty-markdown", '~> 0.6'
  s.add_runtime_dependency 'colsole', '~> 0.6'
  s.add_runtime_dependency 'mister_bin', '~> 0.7'
end
