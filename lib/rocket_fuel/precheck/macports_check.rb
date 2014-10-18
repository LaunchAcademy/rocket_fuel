require 'rocket_fuel/precheck/check'

module RocketFuel
  module Precheck
    class MacportsCheck < Check
      check_name :macports
      register!

      def ok?
        !blacklisted_files_not_found?
      end

      class << self
        def bin_path
          '/opt/local/bin/port'
        end
      end

      protected
      def blacklisted_files_not_found?
        blacklisted_files.each do |file|
          return true if FileTest.exist?(file)
        end

        return false
      end

      #TODO: this abstraction can be applied in many places (rbenv, rvm)
      def blacklisted_files
        [
          self.class.bin_path
        ]
      end

      def success_message
        "MacPorts NOT found."
      end

      def failure_message
        "MacPorts found!"
      end
    end
  end
end
