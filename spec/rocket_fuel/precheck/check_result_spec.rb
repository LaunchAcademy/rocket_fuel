require 'spec_helper'

require 'rocket_fuel/precheck'

describe RocketFuel::Precheck::CheckResult do
  it 'has a boolean result' do
    bool = true
    check_result = RocketFuel::Precheck::CheckResult.new(bool, '')
    expect(check_result.result).to eq(bool)
  end

  it 'has a message' do
    msg = 'Message'
    result = RocketFuel::Precheck::CheckResult.new(true, msg)
    expect(result.message).to eq(msg)
  end
end
