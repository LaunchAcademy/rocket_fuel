module RocketFuel
  module Fix
    class BrewFix < AbstractFix
      fix_name :brew
      register!

      include Thor::Base

      FIX_CMD = 'sudo mkdir -p /usr/local && sudo chown -R $(whoami):admin /usr/local'
      def run
        system(FIX_CMD)
      end

      def title
        'Homebrew requires a writable /usr/local path.'
      end

      def message
        'An important package manager for OS X, named homebrew, requires ' +
        'a writeable directory that is protected by the operating system ' +
        "running `#{FIX_CMD}` will get the job done."
      end
    end
  end
end
