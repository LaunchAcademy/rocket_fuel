require 'spec_helper'

require 'rocket_fuel/precheck/brew_check'

describe RocketFuel::Precheck::BrewCheck do
  include FakeFS::SpecHelpers

  let(:path) { RocketFuel::Precheck::BrewCheck::BREW_PATH }
  let(:check) { RocketFuel::Precheck::BrewCheck.new }

  it 'is ok if the path exists and is writeable' do
    FileUtils.mkdir_p(path)
    expect(check).to be_ok
  end

  it 'is not ok if the path does not exist' do
    FileUtils.rm_rf(path)
    expect(check).to_not be_ok
  end

  it 'has a success message if macports is not found' do
    expect(check.message).to match(/not found/i)
  end

  it 'has a failure message if macports is found' do
    FileUtils.mkdir_p(path)
    expect(check.message).to match(/found/i)
  end

  it 'does not check if not run on a Mac' do
    os = RocketFuel::OperatingSystem.new('linux', '2.6')
    RocketFuel::SystemDetails.stubs(:os).returns(os)
    expect(check).to_not be_check
  end
end
