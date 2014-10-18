require 'rocket_fuel/fix/file_sanitizer_fix'

module RocketFuel
  module Fix
    class RvmFix < FileSanitizerFix
      fix_name :rvm
      register!

      remove_file RocketFuel::Precheck::RvmCheck.home_path
      remove_file RocketFuel::Precheck::RvmCheck.global_path

      def title
        'RVM must be removed for Rocket Fuel to function properly'
      end

      def message
        'Rocket Fuel installs a ruby version manager, chruby, which will ' +
        'not play nicely with RVM. To remove it, you can invoke the command ' +
        '`rvm implode`. Note that once Rocket Fuel has installed successfully, ' +
        'you will likely have to reinstall ruby gems previously installed.'
      end
    end
  end
end
