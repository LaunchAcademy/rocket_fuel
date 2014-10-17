require 'rocket_fuel/precheck/check'

module RocketFuel
  module Precheck
    class RbenvCheck < Check
      check_name :rbenv
      
      def ok?
        !home_path_exists? && !global_path_exists?
      end

      class << self
        def home_path
          File.join(ENV['HOME'], '.rbenv')
        end

        #homebrew recommended, alternative path
        def global_path
          '/usr/local/var/rbenv'
        end
      end

      protected
      def success_message
        "rbenv NOT found."
      end

      def failure_message
        "rbenv found!"
      end

      def home_path_exists?
        FileTest.exist?(self.class.home_path)
      end

      def global_path_exists?
        FileTest.exist?(self.class.global_path)
      end
    end
  end
end
