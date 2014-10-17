require 'rocket_fuel/precheck/command_line_result_presenter'

require 'rocket_fuel/precheck/command_line_tool_check'

module RocketFuel
  module Precheck
    class Run
      def results
        res = [
          RocketFuel::Precheck::CommandLineToolCheck
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
