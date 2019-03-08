require 'jobly'

Jobly.load_custom_config
Jobly::Jobs.load_all
Jobly::SidekiqBoot.configure
