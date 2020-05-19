require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

require 'jobly'
Jobly.app_path = 'spec/fixtures/app'
Jobly.jobs_path = 'spec/fixtures/jobs'
Jobly.config_path = 'spec/fixtures/config'

require 'jobly/boot'

include Jobly
require_relative 'spec_mixin'
include SpecMixin

# Consistent Colsole output (for rspec_fixtures)
ENV['TTY'] = 'off'
ENV['COLUMNS'] = '80'
ENV['LINES'] = '30'

system 'mkdir spec/tmp' unless Dir.exist? 'spec/tmp'

RSpec.configure do |c|
  c.include SpecMixin
  c.include Rack::Test::Methods

  c.strip_ansi_escape = true

  c.before(:all, mockserver: true) do
    require_mock_server!
  end

  def app; described_class; end
end

# Disable annoying spec warning
# ref: https://github.com/philostler/rspec-sidekiq/wiki/FAQ-&-Troubleshooting
RSpec::Sidekiq.configure do |config|
  config.warn_when_jobs_not_processed_by_sidekiq = false
end
