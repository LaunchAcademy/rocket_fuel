require 'spec_helper'

require 'rocket_fuel/precheck/command_line_tool_check'

require 'fakefs'
require 'fakefs/spec_helpers'
require 'fileutils'

describe RocketFuel::Precheck::CommandLineToolCheck do
  include FakeFS::SpecHelpers

  before(:each) do
    FileUtils.mkdir_p(File.dirname(path))
  end

  let(:path) { RocketFuel::Precheck::CommandLineToolCheck::TEN_NINE_RECEIPT_PATH }
  [
    '10.9.4',
    '10.10'
  ].each do |os_vers|
    context "os x #{os_vers}" do
      before(:each) do
        RocketFuel::SystemDetails.stubs(:os_version).returns(os_vers)
      end

      let(:check) { RocketFuel::Precheck::CommandLineToolCheck.new }
      it 'is ok if the receipt file is found' do
        FileUtils.touch(path)
        expect(check).to be_ok
      end

      it 'is not ok if the receipt is not found' do
        FileUtils.rm_f(path) if FileTest.exist?(path)
        expect(check).to_not be_ok
      end

      it 'has a failure message if the receipt is not found' do
        FileUtils.rm_f(path) if FileTest.exist?(path)
        expect(check.run.message).to match(/not found/i)
      end
    end
  end

  context 'os x 10.8' do
    before(:each) do
      RocketFuel::SystemDetails.stubs(:os_version).returns('10.8.4')
    end

    let(:check) { RocketFuel::Precheck::CommandLineToolCheck.new }
    let(:path) { RocketFuel::Precheck::CommandLineToolCheck::DEFAULT_RECEIPT_PATH }
    
    it 'is ok if the receipt file is found' do
      FileUtils.touch(path)
      expect(check).to be_ok
    end

    it 'is not ok if the receipt is not found' do
      FileUtils.rm_f(path) if FileTest.exist?(path)
      expect(check).to_not be_ok
    end
  end

  context 'os x 10.10' do

  end

  it 'does not check for operating systems other than the mac' do
    check = RocketFuel::Precheck::CommandLineToolCheck.new
    RocketFuel::SystemDetails.stubs(:os).returns(:linux)
    expect(check).to_not be_check
  end
end
