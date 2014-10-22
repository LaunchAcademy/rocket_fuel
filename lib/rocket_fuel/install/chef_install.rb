module RocketFuel
  module Install
    class ChefInstall
      def run
        `sudo echo`
        `curl -L https://www.opscode.com/chef/install.sh | sudo bash`
      end
    end
  end
end
