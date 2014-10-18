require 'spec_helper'

require 'rocket_fuel/precheck/macports_check'

describe RocketFuel::Precheck::MacportsCheck do
  include FakeFS::SpecHelpers

  let(:path) { RocketFuel::Precheck::MacportsCheck.bin_path }
  let(:check) { RocketFuel::Precheck::MacportsCheck.new }

  it 'is not ok if macports is found in the users home directory' do
    FileUtils.mkdir_p(path)
    expect(check).to_not be_ok
  end

  it 'is ok if macports is not found or installed' do
    expect(check).to be_ok
  end

  it 'has a success message if macports is not found' do
    expect(check.message).to match(/not found/i)
  end

  it 'has a failure message if macports is found' do
    FileUtils.mkdir_p(path)
    expect(check.message).to match(/found/i)
  end

  it 'does not check if not run on a Mac' do
    RocketFuel::SystemDetails.stubs(:os).returns(:linux)
    expect(check).to_not be_check
  end
end
