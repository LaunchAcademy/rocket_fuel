require 'spec_helper'

require 'rocket_fuel/fix'
require 'fakefs/spec_helpers'

require 'fileutils'

describe RocketFuel::Fix::MacportsFix do
  include FakeFS::SpecHelpers
  let(:fix) { RocketFuel::Fix::MacportsFix.new }

  it 'has a title' do
    expect(fix.title).to match(/Macports/i)
  end

  it 'removes relevant files' do
    fix.class.files_to_remove.each do |path|
      FileUtils.mkdir_p(path)
      fix.run
      expect(FileTest.exist?(path)).to be(false)
    end
  end
end
