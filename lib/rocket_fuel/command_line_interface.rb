module RocketFuel
  class CommandLineInterface < Thor
    package_name 'rocket_fuel'

    desc 'precheck', 'check for requirements prior to installation'
    def precheck
      require 'rocket_fuel/precheck'
      say "\u1f68".encode('UTF-8') + '***Rocket Fuel: Checking prerequisites***', :blue
      say ''

      RocketFuel::Precheck::Run.new.results

    end

    desc 'install [package]', 'install rocket fuel packages'
    def install
    end
  end
end
