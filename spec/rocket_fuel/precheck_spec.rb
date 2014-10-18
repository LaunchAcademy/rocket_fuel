require 'spec_helper'

require 'rocket_fuel/precheck'

describe RocketFuel::Precheck do
  it 'has a map of checks' do
    expect(RocketFuel::Precheck.checks[:rvm].ancestors).to include(
      RocketFuel::Precheck::Check)
  end
end
