require 'capybara'
require 'capybara/danger_zone/highway'
require 'capybara/danger_zone/wait'
require 'capybara/danger_zone/version'

module Capybara
  module DangerZone
    DangerZoneError = Class.new(StandardError)

    Capybara::Node::Base.prepend(Highway)

    class << self
      def enabled?
        @enabled
      end

      def enable
        @enabled = true
      end

      def disable
        @enabled = false
      end

      def rate_threshold
        @rate_threshold ||= 0.8
      end

      def rate_threshold=(value)
        @rate_threshold = value
      end
    end
  end
end
