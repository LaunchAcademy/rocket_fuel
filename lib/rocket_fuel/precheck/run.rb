require 'rocket_fuel/precheck/command_line_result_presenter'

require 'rocket_fuel/precheck/command_line_tool_check'
require 'rocket_fuel/precheck/rvm_check'
require 'rocket_fuel/precheck/rbenv_check'
require 'rocket_fuel/precheck/macports_check'

module RocketFuel
  module Precheck
    class Run
      def results
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
        end
      end
    end
  end
end
