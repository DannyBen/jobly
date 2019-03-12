module Jobs

  # A nested job, can be executed with Inner::Hi or Inner/Hi
  module Inner
    class Hi < Jobly::Job
      def execute(name: 'bob')
        puts "Hi #{name}, this is #{self.class.name}"
        logger.info "said hello to #{name} from #{self.class.name}"
      end
    end
  end

end