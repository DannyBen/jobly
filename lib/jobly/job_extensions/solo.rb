require 'jobly/job_extensions/actions'

module Jobly
  module JobExtensions
    module Solo
      include Actions

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        attr_reader :solo_key

        def solo(expire: 1.hour, key: nil)
          @solo_enabled = true
          @solo_key = key
          before { solo_locked? ? skip_job : solo_lock(expire) }
          after  { solo_unlock }
        end

        def solo?
          !!@solo_enabled
        end
      end

      def solo?
        self.class.solo?
      end

      def solo_key
        @solo_key ||= (self.class.solo_key || solo_key!)
      end

      def solo_key!
        Digest::MD5.hexdigest "#{self.class.name}:#{params}"
      end

      def solo_full_key
        "jobly:solo:#{solo_key}"
      end

      def solo_locked?
        Sidekiq.redis do |redis|
          redis.keys(solo_full_key).count >= 1
        end
      end

      def solo_lock(expire = 1.hour)
        Sidekiq.redis do |redis|
          redis.setex(solo_full_key, expire, "1")
        end
      end

      def solo_unlock
        Sidekiq.redis do |redis|
          redis.del solo_full_key
        end
      end

    end
  end
end
