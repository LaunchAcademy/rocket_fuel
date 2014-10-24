module RocketFuel
  module Install
    class ChefInstall
      RECEIPT_FILE = '/var/db/receipts/com.getchef.pkg.chef.bom'
      def run
        `sudo echo`
        `curl -L https://www.opscode.com/chef/install.sh | sudo bash`
      end

      def installed?
        if RocketFuel::SystemDetails.platform_family?(:mac)
          FileTest.exists?(RECEIPT_FILE)
        else
          false
        end
      end
    end
  end
end
