module RocketFuel
  module Precheck
    class CheckResult
      attr_reader :result
      attr_reader :message
      attr_reader :check_name

      def initialize(result, message, check_name)
        @result, @message, @check_name = result, message, check_name
      end

      def ok?
        result
      end
    end
  end
end
