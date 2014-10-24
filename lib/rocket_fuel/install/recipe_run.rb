module RocketFuel
  module Install
    class RecipeRun
      def run
        chdir_cmd = "cd #{RocketFuel::Install::RECIPE_PATH}"
        system("#{chdir_cmd} && sudo chef-solo " +
          "-c cookbooks/fueled-#{recipe_name}-station/config.rb " +
          "-j cookbooks/fueled-#{recipe_name}-station/roles/default.json")
      end

      def recipe_name
        RocketFuel::SystemDetails.platform_family?(:mac) ? 'osx' : 'linux'
      end
    end
  end
end
