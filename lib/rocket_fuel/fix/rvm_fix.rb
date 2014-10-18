module RocketFuel
  module Fix
    class RvmFix < AbstractFix
      fix_name :rvm
      register!

      def run
        [
          RocketFuel::Precheck::RvmCheck.home_path,
          RocketFuel::Precheck::RvmCheck.global_path
        ].each do |path|
          if FileTest.exist?(path)
            FileUtils.rm_rf(path)
          end
        end
      end

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
