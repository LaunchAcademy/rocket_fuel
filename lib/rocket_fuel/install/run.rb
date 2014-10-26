require 'rocket_fuel/install/download'
require 'rocket_fuel/install/chef_install'
require 'rocket_fuel/install/recipe_run'

module RocketFuel
  module Install
    class Run
      include Thor::Base

      def initialize
        @download = RocketFuel::Install::Download.new
      end

      def run
        say('Downloading rocket fuel recipes...')
        @download.retrieve
        say('Done.')
        say('Extracting rocket fuel recipes...')
        @download.extract
        say('Done.')
        say('Checking to see if Chef is installed...')
        chef_install = RocketFuel::Install::ChefInstall.new
        if chef_install.installed?
          say('Done')
        else
          say('Installing chef omnibus. You may be prompted for your sudo password..')
          chef_install.run
          say('Done.')
        end
        say('Running rocket fuel recipes...this may take some time')
        run = RocketFuel::Install::RecipeRun.new
        say('')
        
        if run.run
          say("Congratuations! You're now running with RocketFuel!", :green)
        else
          say('Something went wrong.', :red)
        end
        say('Done')
      end
    end
  end
end
