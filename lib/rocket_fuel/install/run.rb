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
        say('Installing chef omnibus. You may be prompted for your sudo password..')
        RocketFuel::Install::ChefInstall.new.run
        say('Done.')
        say('Running rocket fuel recipes...this may take some time')
        RocketFuel::Install::RecipeRun.new.run
        say('Done')
      end
    end
  end
end
