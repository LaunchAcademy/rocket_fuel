require 'spec_helper'

require 'rocket_fuel/precheck/check_result'

describe RocketFuel::Precheck::CheckResult do
  it 'has a boolean result' do
    bool = true
    check_result = RocketFuel::Precheck::CheckResult.new(bool, '', :something)
    expect(check_result.result).to eq(bool)
  end

  it 'has a message' do
    msg = 'Message'
    result = RocketFuel::Precheck::CheckResult.new(true, msg, :something)
    expect(result.message).to eq(msg)
  end

  it 'has a check_name'do
    check_name = :something
    result = RocketFuel::Precheck::CheckResult.new(true, 'a msg', :something)
    expect(result.check_name).to eq(check_name)
  end
end
