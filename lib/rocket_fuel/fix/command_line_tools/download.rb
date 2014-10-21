module RocketFuel
  module Fix
    module CommandLineTools
      class Download
        URLS = {
          '10.10' => '/downloads/download.action?path=Developer_Tools/command_line_tools_os_x_10.10_for_xcode__xcode_6.1/command_line_tools_for_osx_10.10_for_xcode_6.1.dmg',
          '10.9' => '/downloads/download.action?path=Developer_Tools/command_line_tools_os_x_mavericks_for_xcode__april_2014/command_line_tools_for_osx_mavericks_april_2014.dmg',
          '10.8' => '/downloads/download.action?path=Developer_Tools/command_line_tools_os_x_mountain_lion_for_xcode__april_2014/command_line_tools_for_osx_mountain_lion_april_2014.dmg',
          '10.7' => '/downloads/download.action?path=Developer_Tools/command_line_tools_os_x_lion_for_xcode__april_2013/xcode462_cltools_10_76938260a.dmg'
        }

        FILE_NAME = 'command-line-tools.dmg'
        DEFAULT_DMG_PATH = "/tmp/#{FILE_NAME}"

        def url
          base_host + URLS[os_minor]
        end

        protected
        def os_minor
          RocketFuel::SystemDetails.os_version.gsub(/\.*\Z/, '')
        end

        def base_host
          'https://developer.apple.com'
        end
      end
    end
  end
end
