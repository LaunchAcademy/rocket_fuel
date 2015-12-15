require 'rocket_fuel/precheck/check'

module RocketFuel
  module Precheck
    class BrewCheck < Check
      BREW_PATH = '/usr/local'

      check_name :brew
      register!

      def ok?
        FileTest.exist?(BREW_PATH)
      end

      def check?
        RocketFuel::SystemDetails.platform_family?(:mac)
      end

      protected
      def success_message
        "brew path found."
      end

      def failure_message
        "brew path NOT found!"
      end
    end
  end
end
