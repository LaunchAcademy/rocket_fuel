require 'rocket_fuel/precheck/check_result'

module RocketFuel
  module Precheck
    class Check
      def ok?
        virtual_method(:ok?)
      end

      def run
        CheckResult.new(ok?, message, self.class.check_name_value)
      end

      def check?
        true
      end

      def message
        ok? ? success_message : failure_message
      end

      class << self
        def check_name(sym)
          @check_name = sym
        end

        def check_name_value
          @check_name
        end
      end

      protected
      def success_message
        virtual_method(:success_message)
      end

      def failure_message
        virtual_method(:failure_message)
      end

      def virtual_method(method_name)
        raise RocketFuel::NotImplementedError,
          "you must override the `#{method_name}` in your check"
      end
    end
  end
end
