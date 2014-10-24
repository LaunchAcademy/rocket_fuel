require 'spec_helper'

require 'rocket_fuel/precheck'

describe RocketFuel::Precheck::CurlCheck do
  it 'checks for linux' do
    os = RocketFuel::OperatingSystem.new('linux', '2.6')
    RocketFuel::SystemDetails.stubs(:os).returns(os)
    expect(RocketFuel::Precheck::CurlCheck.new).to be_check
  end

  it 'does not check for operating systems other than linux' do
    os = RocketFuel::OperatingSystem.new('darwin', '10.7')
    RocketFuel::SystemDetails.stubs(:os).returns(os)
    expect(RocketFuel::Precheck::CurlCheck.new).to_not be_check
  end
end
