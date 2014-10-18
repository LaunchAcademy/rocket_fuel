require 'spec_helper'

require 'rocket_fuel/fix'
require 'fakefs/spec_helpers'

require 'fileutils'

describe RocketFuel::Fix::RvmFix do
  include FakeFS::SpecHelpers
  let(:fix) { RocketFuel::Fix::RvmFix.new }

  it 'has a title' do
    expect(fix.title).to match(/rvm/i)
  end

  it 'removes files in the home directory' do
    path = RocketFuel::Precheck::RvmCheck.home_path
    FileUtils.mkdir_p(path)
    fix.run
    expect(FileTest.exist?(path)).to be(false)
  end

  it 'removes files in the global directory' do
    path = RocketFuel::Precheck::RvmCheck.global_path
    FileUtils.mkdir_p(path)
    fix.run
    expect(FileTest.exist?(path)).to be(false)
  end
end
