module Capybara
  module DangerZone
    class Wait
      def initialize(start_time, end_time, maximum_seconds)
        @start_time      = start_time
        @end_time        = end_time
        @maximum_seconds = maximum_seconds
        @element         = element
      end

      def exceeded_threshold?
        rate > DangerZone.rate_threshold
      end

      def seconds_waited
        (end_time - start_time).round(2)
      end

      private

      attr_reader :start_time, :end_time, :maximum_seconds, :element

      def rate
        seconds_waited / maximum_seconds
      end
    end
  end
end
