module RocketFuel
  module Precheck
    class RvmCheck < Check
      def ok?
        !home_path_exists? && !global_path_exists?
      end

      class << self
        def home_path
          File.join(ENV['HOME'], '.rvm')
        end

        def global_path
          '/usr/local/rvm'
        end
      end

      protected
      def success_message
        "RVM NOT found."
      end

      def failure_message
        "RVM found!"
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
