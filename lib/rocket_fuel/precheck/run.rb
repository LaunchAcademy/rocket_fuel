require 'thor'

require 'rocket_fuel/precheck/command_line_result_presenter'

require 'rocket_fuel/precheck/command_line_tool_check'
require 'rocket_fuel/precheck/rvm_check'
require 'rocket_fuel/precheck/rbenv_check'
require 'rocket_fuel/precheck/macports_check'
require 'rocket_fuel/precheck/curl_check'

require 'rocket_fuel/fix'

module RocketFuel
  module Precheck
    class Run
      include Thor::Base
      def ok?
        !@failed_checks.nil? && @failed_checks.empty?
      end

      def results
        @failed_checks = []
        RocketFuel::Precheck.checks.each do |key, klass|
          check = klass.new
          if check.check?
            CommandLineResultPresenter.new(check).present
            if !check.ok?
              @failed_checks << key
            end
          end
        end

        say('')
        say('========================')
        say('')

        if !@failed_checks.empty?
          say('***YOU ARE NOT CLEARED FOR INSTALLATION***', :red)
          say('')

          @failed_checks.each do |sym|
            if RocketFuel::Precheck.fixes[sym]
              fix = RocketFuel::Precheck.fixes[sym].new
              say("#{fix.title}", :red)
              say('')
              print_wrapped(fix.message, :indent => 2)

              say('')
              print_wrapped("Rocket Fuel can tackle this for you. " +
                "Invoke `rocket_fuel fix #{sym}` to resolve this issue.",
                :indent => 2)
            end
          end
        else
          say('***Congratulations! You\'re cleared to install with Rocket Fuel***', :green)
          say('')
          say('Run `rocket_fuel install` to proceed.')
        end
      end
    end
  end
end
