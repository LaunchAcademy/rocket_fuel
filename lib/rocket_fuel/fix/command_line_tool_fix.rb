module RocketFuel
  module Fix
    class CommandLineToolFix < AbstractFix
      fix_name :command_line_tools
      register!

      include Thor::Base

      def run
        system('xcode-select --install')
      end

      def title
        'Command Line Tools must be installed for you to install ruby!'
      end

      def message
        'Installing Ruby requires a C compiler. For the Mac, Apple provides ' +
        'a package known as "Command Line Tools" which includes a C compiler. ' +
        'Most of the time running `xcode-select --install` will get the job done.'
      end
    end
  end
end
