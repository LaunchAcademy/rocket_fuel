module RocketFuel
  class CommandLineInterface < Thor
    package_name 'rocket_fuel'

    desc 'precheck', 'check for requirements prior to installation'
    def precheck
      require 'rocket_fuel/precheck'
      say '***Rocket Fuel: Checking prerequisites***', :blue
      say ''

      RocketFuel::Precheck::Run.new.results

    end

    desc 'fix', 'fix problems that can cause issues with running rocket fuel'
    def fix(fix)
      require 'rocket_fuel/precheck'
      require 'rocket_fuel/fix'
      if fix_class = RocketFuel::Precheck.fixes[fix.to_sym]
        the_fix = fix_class.new
        say(the_fix.title)
        say('Fixing...')
        the_fix.run
        say('')

        if the_fix.check
          if the_fix.check.ok?
            say('Fix successful.', :green)
          else
            say('Fix failed.', :red)
          end
        end
      end
    end

    desc 'install [package]', 'install rocket fuel packages'
    def install
    end
  end
end
