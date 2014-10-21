require 'rocket_fuel/command_line_icon'

module RocketFuel
  module Precheck
    class CommandLineResultPresenter
      include Thor::Base

      SUCCESS_ICON = ["\u2713", '[ok]    ']
      FAILURE_ICON = ["\u00D7", '[failed]']

      def initialize(result)
        @result = result
      end

      def present
        print_wrapped(set_color([icon.render, @result.message].join(" "), color),
          :indent => 2)
      end

      protected
      def icon
        @result.ok? ? success_icon : failure_icon
      end

      def success_icon
        @success_icon ||= RocketFuel::CommandLineIcon.new(*SUCCESS_ICON)
      end

      def failure_icon
        @failure_icon ||= RocketFuel::CommandLineIcon.new(*FAILURE_ICON)
      end

      def color
        @result.ok? ? :green : :red
      end
    end
  end
end
