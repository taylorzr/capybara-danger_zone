module Capybara
  module DangerZone
    module Highway
      def synchronize(seconds = Capybara.default_max_wait_time, options = {})
        start_time = Time.now
        result     = super
        end_time   = Time.now

        if seconds != 0
          wait = Wait.new(start_time, end_time, seconds)

          if DangerZone.enabled? && wait.exceeded_threshold?
            raise DangerZoneError,
              "Waited #{wait.seconds_waited} out of a maximum #{seconds} seconds, this query has passed into the danger zone!"
          end
        end

        result
      end
    end
  end
end
