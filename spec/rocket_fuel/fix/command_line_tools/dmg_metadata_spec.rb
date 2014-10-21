require 'spec_helper'

require'rocket_fuel/fix'

describe RocketFuel::Fix::CommandLineTools::DmgMetadata do
  RocketFuel::SystemDetails::SUPPORTED_OSX_MINORS.each do |version|
    let(:dmg_metadata) { RocketFuel::Fix::CommandLineTools::DmgMetadata.new('') }

    it "has a volume dir for #{version}" do
      RocketFuel::SystemDetails.os.stubs(:minor_version).returns(version)
      expect(dmg_metadata.volume_dir).to_not be_nil
    end

    it "has a pkg_name for #{version}" do
      RocketFuel::SystemDetails.os.stubs(:minor_version).returns(version)
      expect(dmg_metadata.pkg_name).to_not be_nil
    end
  end
end
