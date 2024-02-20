require 'jobly'

Jobly.load_custom_config
Jobly::SidekiqBoot.configure
Jobly::Jobs.load_all
