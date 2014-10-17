module RocketFuel
  module Precheck
    class CommandLineToolCheck
      TEN_NINE_RECEIPT_PATH = '/var/db/receipts/com.apple.pkg.CLTools_Executables.bom'
      DEFAULT_RECEIPT_PATH = '/var/db/receipts/com.apple.pkg.DeveloperToolsCLI.bom'
      def run
        CheckResult.new(ok?, message)
      end

      def ok?
        installed?
      end

      protected
      def message
        ok? ? success_message : failure_message
      end

      def failure_message
        'Command Line Tools NOT found.'
      end

      def success_message
        'Command Line Tools found.'
      end
      def installed?
        FileTest.exist?(receipt_file)
      end

      def receipt_file
        if RocketFuel::SystemDetails.os_version =~ /\A10.9/
          TEN_NINE_RECEIPT_PATH
        else
          DEFAULT_RECEIPT_PATH
        end
      end
    end
  end
end
