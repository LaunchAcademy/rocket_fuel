require 'rocket_fuel/operating_system'

module RocketFuel
  module SystemDetails
    SUPPORTED_OSX_MINORS = ['10.10', '10.9', '10.8', '10.7']

    class << self
      def os_version
        os.version
      end

      def os
        @os ||= RocketFuel::OperatingSystem.new
      end

      def platform_family?(platform)
        os.platform_family?(platform)
      end
    end
  end
end
