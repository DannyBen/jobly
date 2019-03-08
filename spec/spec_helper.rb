require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

require 'jobly'
Jobly.jobs_path = 'spec/fixtures/jobs'
require 'jobly/boot'

include Jobly

require_relative 'spec_mixin'

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
