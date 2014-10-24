require 'rocket_fuel/precheck/check'

module RocketFuel
  module Precheck
    class CurlCheck < Check
      check_name :curl
      register!

      def ok?
        installed?
      end

      def check?
        RocketFuel::SystemDetails.platform_family?(:linux)
      end

      protected
      def installed?
        `curl --help`
        $?.exitstatus == 0
      end

      def failure_message
        'curl NOT found.'
      end

      def success_message
        'curl found.'
      end
    end
  end
end
