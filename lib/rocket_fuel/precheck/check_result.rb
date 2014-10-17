module RocketFuel
  module Precheck
    class CheckResult
      attr_reader :result
      attr_reader :message

      def initialize(result, message)
        @result, @message = result, message
      end

      def ok?
        result
      end
    end
  end
end
