require 'spec_helper'

require 'rocket_fuel/precheck'
require 'rocket_fuel/precheck/run'

describe RocketFuel::Precheck::RbenvCheck do
  include FakeFS::SpecHelpers

  let(:home_path) { RocketFuel::Precheck::RbenvCheck.home_path }
  let(:global_path) { RocketFuel::Precheck::RbenvCheck.global_path  }
  let(:check) { RocketFuel::Precheck::RbenvCheck.new }

  it 'is not ok if rbenv is found in the users home directory' do
    FileUtils.mkdir_p(home_path)
    expect(check).to_not be_ok
  end

  it 'is not ok if rm is found in the global directory' do
    FileUtils.mkdir_p(global_path)
    expect(check).to_not be_ok
  end

  it 'is ok if rbenv is not found or installed' do
    expect(check).to be_ok
  end

  it 'has a success message if rbenv is not found' do
    expect(check.message).to match(/not found/i)
  end

  it 'has a failure message if rbenv is found' do
    FileUtils.mkdir_p(home_path)
    expect(check.message).to match(/found/i)
  end
end
