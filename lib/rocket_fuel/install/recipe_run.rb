module RocketFuel
  module Install
    class RecipeRun
      def run
        chdir_cmd = "cd #{RocketFuel::Install::RECIPE_PATH}"
        io = system("#{chdir_cmd} && chef-solo -c cookbooks/fueled-osx-station/config.rb ' +
          '-j cookbooks/fueled-osx-station/roles/default.json")
      end
    end
  end
end
