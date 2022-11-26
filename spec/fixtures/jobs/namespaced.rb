module Namespaced
  class Hello < Jobly::Job
    def execute(name: 'there')
      # :nocov:
      puts "Hi #{name}, I am namspaced as #{self.class.name}"
      # :nocov:
    end
  end
end
