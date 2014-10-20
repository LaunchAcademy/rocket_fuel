require 'spec_helper'

describe RocketFuel::OperatingSystem do
  context '10.10' do
    let(:minor) { '10.10' }
    let(:os) { RocketFuel::OperatingSystem.new('darwin', minor) }

    it 'has a name' do
      expect(os.name).to eq(:mac)
    end

    it 'has a version' do
      expect(os.version).to eq(minor)
    end

    it 'has a minor version' do
      expect(os.minor_version).to eq(minor)
    end
  end

  context '10.9' do
    let(:minor) { '10.9' }
    let(:os) { RocketFuel::OperatingSystem.new('darwin', minor + '.4') }

    it 'has a minor version' do
      expect(os.minor_version).to eq(minor)
    end
  end
end
