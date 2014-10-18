require 'spec_helper'

require 'rocket_fuel/fix'
require 'fakefs/spec_helpers'

require 'fileutils'

describe RocketFuel::Fix::RbenvFix do
  include FakeFS::SpecHelpers
  let(:fix) { RocketFuel::Fix::RbenvFix.new }

  it 'has a title' do
    expect(fix.title).to match(/rbenv/i)
  end

  it 'removes files in the home directory' do
    path = RocketFuel::Precheck::RbenvCheck.home_path
    FileUtils.mkdir_p(path)
    fix.run
    expect(FileTest.exist?(path)).to be(false)
  end

  it 'removes files in the global directory' do
    path = RocketFuel::Precheck::RbenvCheck.global_path
    FileUtils.mkdir_p(path)
    fix.run
    expect(FileTest.exist?(path)).to be(false)
  end
end
