require 'rocket_fuel/fix/file_sanitizer_fix'
module RocketFuel
  module Fix
    class RbenvFix < FileSanitizerFix
      fix_name :rbenv
      register!

      remove_file RocketFuel::Precheck::RbenvCheck.home_path
      remove_file RocketFuel::Precheck::RbenvCheck.global_path

      def title
        'rbenv must be removed for Rocket Fuel to function properly'
      end

      def message
        'Rocket Fuel installs a ruby version manager, chruby, which will ' +
        'not play nicely with rbenv. To remove it, you can invoke the command ' +
        '`rm -rf ~/.rbenv && rm -rf /usr/local/var/rbenv`. ' +
        'Note that once Rocket Fuel has installed successfully, ' +
        'you will likely have to reinstall ruby gems previously installed.'
      end
    end
  end
end
