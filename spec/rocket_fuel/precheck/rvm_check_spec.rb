require 'spec_helper'

require 'rocket_fuel/precheck'

require 'fakefs'
require 'fakefs/spec_helpers'
require 'fileutils'

describe RocketFuel::Precheck::RvmCheck do
  include FakeFS::SpecHelpers

  let(:home_path) { RocketFuel::Precheck::RvmCheck.home_path }
  let(:global_path) { RocketFuel::Precheck::RvmCheck.global_path  }
  let(:check) { RocketFuel::Precheck::RvmCheck.new }

  it 'is not ok if rvm is found in the users home directory' do
    FileUtils.mkdir_p(home_path)
    expect(check).to_not be_ok
  end

  it 'is not ok if rvm is found in the global directory' do
    FileUtils.mkdir_p(global_path)
    expect(check).to_not be_ok
  end

  it 'is ok if rvm is not found or installed' do
    expect(check).to be_ok
  end

  it 'has a success message if rvm is not found' do
    expect(check.message).to match(/not found/i)
  end

  it 'has a failure message if rvm is found' do
    FileUtils.mkdir_p(home_path)
    expect(check.message).to match(/found/i)
  end
end
