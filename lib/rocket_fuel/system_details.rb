require 'rbconfig'

module RocketFuel
  module SystemDetails
    class << self
      def os_version
        if platform_family?(:mac)
          `sw_vers -productVersion`.chomp
        end
      end

      # cribbed from Selenium
      def os
        host_os = RbConfig::CONFIG['host_os']
        case host_os
        when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
          :windows
        when /darwin|mac os/
          :mac
        when /linux/
          :linux
        when /solaris|bsd/
          :unix
        end
      end

      def platform_family?(platform)
        os == platform.to_sym
      end
    end
  end
end
