require 'rocket_fuel/fix/command_line_tools/download_routine'
require 'rocket_fuel/fix/command_line_tools/install'
module RocketFuel
  module Fix
    class CommandLineToolFix < AbstractFix
      fix_name :command_line_tools
      register!

      include Thor::Base

      ACCOUNT_CREATION_URL = 'https://developer.apple.com/register/index.action'
      APPLESCRIPT_PATH = File.join(File.dirname(__FILE__),
        'command_line_tools', 'install.applescript')

      def run
        dev_account = ask('Do you have an apple developer account?',
          :limited_to => ['y', 'n'])
        if dev_account == 'n'
          say("Please register at #{ACCOUNT_CREATION_URL} and rerun " +
            "this command.")
          return false
        else
          routine = CommandLineTools::DownloadRoutine.new
          say('')
          say('Downloading Command Line Tools. ' +
            'You will be prompted for your Apple account and password. ' +
            'NOTE: rocket_fuel never stores your Apple account or password.')
          dmg_path = routine.run
          say('Done.')

          install = CommandLineTools::Install.new(dmg_path)
          say('')
          say("Installing Command Line Tools. " +
            "You will be prompted for your sudo password.")
          install.run
          say('Done.')
        end
      end

      def title
        'Command Line Tools must be installed for you to install ruby!'
      end

      def message
        'Installing Ruby requires a C compiler. For the Mac, Apple provides ' +
        'a package known as "Command Line Tools" which includes a C compiler. ' +
        'In order to download these tools, you must create an Apple Developer ' +
        "account @ #{ACCOUNT_CREATION_URL}. Once " +
        'you\'ve created an account, you can download the version of command ' +
        'line tools appropriate for your version of OS X at ' +
        'https://developer.apple.com/downloads/index.action' +
        'Our fix is available in an experimental capacity. Once you have ' +
        'created an Apple Developer account, invoke: ' +
        '`rocket_fuel fix command_line_tools` ' +
        'The fix involves an experimental script that will ask for your ' +
        'Apple ID and password. Please note that rocket_fuel NEVER stores ' +
        'your login information'
      end
    end
  end
end
