module RocketFuel
  module Precheck
    class CommandLineResultPresenter
      include Thor::Base

      SUCCESS_ICON = "\u2713".encode('utf-8')
      FAILURE_ICON = "\u00D7".encode('utf-8')

      def initialize(result)
        @result = result
      end

      def present
        say([icon, @result.message].join(" "), color)
      end

      protected
      def icon
        @result.ok? ? SUCCESS_ICON : FAILURE_ICON
      end

      def color
        @result.ok? ? :green : :red
      end
    end
  end
end
