module RocketFuel
  module Install
    class RecipeRun
      def run
        chdir_cmd = "cd #{RocketFuel::Install::RECIPE_PATH}"
        system("#{chdir_cmd} && sudo chef-solo -c cookbooks/fueled-osx-station/config.rb " +
          "-j cookbooks/fueled-osx-station/roles/default.json")
      end
    end
  end
end
