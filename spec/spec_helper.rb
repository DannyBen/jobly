require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

require 'jobly'
Jobly.jobs_path = 'spec/fixtures/jobs'
Jobly.config_path = 'spec/fixtures/config'
require 'jobly/boot'

include Jobly

require_relative 'spec_mixin'
system 'mkdir spec/tmp' unless Dir.exist? 'spec/tmp'

ENV['JOBLY_TEST_MODE'] = '1'

RSpec.configure do |c|
  c.include SpecMixin
  c.include Rack::Test::Methods

  c.fixtures_path = 'spec/approvals'

  def app; described_class; end
end

# Disable annoying spec warning
# ref: https://github.com/philostler/rspec-sidekiq/wiki/FAQ-&-Troubleshooting
RSpec::Sidekiq.configure do |config|
  config.warn_when_jobs_not_processed_by_sidekiq = false
end
