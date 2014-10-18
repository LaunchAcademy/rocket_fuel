require 'rocket_fuel/precheck'

module RocketFuel
  module Fix
    class AbstractFix
      class << self
        def fix_name(fix_name)
          @fix_name = fix_name
        end

        def fix_name_value
          @fix_name
        end

        def register!
          RocketFuel::Precheck.register_fix(self)
        end
      end

      def check
        unless @check
          if klass = RocketFuel::Precheck.checks[self.class.fix_name_value]
            @check = klass.new
          end
        end
        @check
      end
    end
  end
end
