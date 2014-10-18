require 'rocket_fuel/fix/file_sanitizer_fix'
module RocketFuel
  module Fix
    class MacportsFix < FileSanitizerFix
      UNINSTALL_URL = 'https://guide.macports.org/chunked/' +
        'installing.macports.uninstalling.html'

      fix_name :macports
      register!

      #file manifest retrieved from
      #https://guide.macports.org/chunked/installing.macports.uninstalling.html
      remove_file '/opt/local'
      remove_file '/Applications/DarwinPorts'
      remove_file '/Applications/MacPorts'
      remove_file '/Library/LaunchDaemons/org.macports.*'
      remove_file '/Library/Receipts/DarwinPorts*.pkg'
      remove_file '/Library/Receipts/MacPorts*.pkg'
      remove_file '/Library/StartupItems/DarwinPortsStartup'
      remove_file '/Library/Tcl/darwinports1.0'
      remove_file '/Library/Tcl/macports1.0'
      remove_file File.join(ENV['HOME'], '.macports')

      def title
        'macports must be removed for Rocket Fuel to function properly'
      end

      def message
        'Rocket Fuel installs a package manager, homebrew, which will ' +
        'not play nicely with macports. You can follow uninstallation ' +
        "instructions at #{UNINSTALL_URL}" +
        'to remove macports.'
      end
    end
  end
end
