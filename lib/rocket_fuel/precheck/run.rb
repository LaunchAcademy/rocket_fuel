require 'rocket_fuel/precheck/command_line_result_presenter'

require 'rocket_fuel/precheck/command_line_tool_check'
require 'rocket_fuel/precheck/rvm_check'
require 'rocket_fuel/precheck/rbenv_check'
require 'rocket_fuel/precheck/macports_check'

module RocketFuel
  module Precheck
    class Run
      def results
        failed_checks = []
        res = [
          RocketFuel::Precheck::CommandLineToolCheck,
          RocketFuel::Precheck::MacportsCheck,
          RocketFuel::Precheck::RvmCheck,
          RocketFuel::Precheck::RbenvCheck
        ].map do |klass|
          klass.new.run
        end
        res.each do |r|
          CommandLineResultPresenter.new(r).present
          if !r.ok?
            failed_checks << r.check_name
          end
        end


        if !failed_checks.empty?
          say('***YOU ARE NOT CLEARED FOR INSTALLATION***', :red)


        end
      end
    end
  end
end
