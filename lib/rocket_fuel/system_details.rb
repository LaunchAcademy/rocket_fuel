module RocketFuel
  module SystemDetails
    class << self
      def os_version
        `sw_vers -productVersion`.chomp
      end
    end
  end
end
