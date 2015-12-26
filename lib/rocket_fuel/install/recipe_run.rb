module RocketFuel
  module Install
    class RecipeRun
      def initialize(options = {})
        @options = options
      end

      def run
        chdir_cmd = "cd #{RocketFuel::Install::RECIPE_PATH}"
        system("#{chdir_cmd} && sudo chef-solo " +
          "-c cookbooks/fueled-#{cookbook_name}-station/config.rb " +
          "-j cookbooks/fueled-#{cookbook_name}-station/roles/#{recipe_name}.json")
      end

      def cookbook_name
        if @options[:vagrant] || !RocketFuel::SystemDetails.platform_family?(:mac)
          'linux'
        else
          'osx'
        end
      end

      def recipe_name
        if @options[:vagrant]
          'vagrant'
        else
          'default'
        end
      end
    end
  end
end
