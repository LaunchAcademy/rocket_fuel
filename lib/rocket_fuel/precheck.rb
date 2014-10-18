module RocketFuel
  module Precheck
    def self.checks
      @checks
    end

    def self.register_check(check)
      @checks ||= {}
      @checks[check.check_name_value] = check
    end

    def self.fixes
      @fixes
    end

    def self.register_fix(fix)
      @fixes ||= {}
      @fixes[fix.fix_name_value] = fix
    end
  end
end

require 'rocket_fuel/precheck/check_result'

require 'rocket_fuel/precheck/run'
require 'rocket_fuel/fix'
