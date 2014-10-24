require 'rocket_fuel/fix/abstract_fix'

module RocketFuel
  module Fix
    class CurlFix < AbstractFix
      fix_name :curl
      register!

      def run
        system('sudo apt-get install curl -y')
      end

      def title
        'curl must be installed for rocket fuel to work propertly!'
      end

      def message
        'Rocket Fuel needs to download a series of tools, and curl is used ' +
        'to manage those downloads. You must install the tool for rocket fuel ' +
        'to work. For Linux installations that use apt for package management, ' +
        'you can invoke `sudo apt-get install curl` to install.'
      end
    end
  end
end
