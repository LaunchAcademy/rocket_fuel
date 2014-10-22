module RocketFuel
  module Install
    class RecipeRun
      def run
        `cd #{RocketFuel::Install::RECIPE_PATH}`
        puts `chef-solo -c cookbooks/fueled-osx-station/config.rb -j cookbooks/fueled-osx-station/roles/default.json`
      end
    end
  end
end
