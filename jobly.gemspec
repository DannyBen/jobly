lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jobly/version'

Gem::Specification.new do |s|
  s.name        = 'jobly'
  s.version     = Jobly::VERSION
  s.summary     = 'Compact job server with API, CLI, Web UI and a Sidekiq heart'
  s.description = 'Execute background jobs and build tasks on this sidekiq-based job server'
  s.authors     = ['Danny Ben Shitrit']
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*']
  s.executables = ['jobly']
  s.homepage    = 'https://jobly.dannyb.co/'
  s.metadata = {
    'bug_tracker_uri'       => 'https://github.com/dannyben/jobly/issues',
    'changelog_uri'         => 'https://github.com/DannyBen/jobly/blob/master/CHANGELOG.md',
    'documentation_uri'     => 'https://jobly.dannyb.co/',
    'source_code_uri'       => 'https://github.com/dannyben/jobly',
    'rubygems_mfa_required' => 'true',
  }
  s.license = 'MIT'
  s.required_ruby_version = '>= 2.7'

  s.add_runtime_dependency 'colsole', '~> 0.7.0'
  s.add_runtime_dependency 'http', '~> 5.0'
  s.add_runtime_dependency 'mister_bin', '~> 0.7.0'
  s.add_runtime_dependency 'pretty_trace', '~> 0.2.4'
  s.add_runtime_dependency 'puma', '>= 5.1', '< 7'
  s.add_runtime_dependency 'remote_syslog_logger', '~> 1.0'
  s.add_runtime_dependency 'requires', '~> 1.0'
  s.add_runtime_dependency 'sidekiq', '~> 6.5'
  s.add_runtime_dependency 'sidekiq-status', '~> 2.0'
  s.add_runtime_dependency 'sinatra', '~> 3.0'
  s.add_runtime_dependency 'sinatra-contrib', '~> 3.0'
  s.add_runtime_dependency 'slack-notifier', '~> 2.3'
  s.add_runtime_dependency 'sting', '~> 0.5.0'
  s.add_runtime_dependency 'tty-command', '~> 0.9'
  s.add_runtime_dependency 'tty-markdown', '~> 0.6'
end
