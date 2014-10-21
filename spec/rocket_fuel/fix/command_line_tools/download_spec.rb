require 'spec_helper'

require'rocket_fuel/fix'

describe RocketFuel::Fix::CommandLineTools::Download do
  RocketFuel::SystemDetails::SUPPORTED_OSX_MINORS.each do |version|
    let(:download) { RocketFuel::Fix::CommandLineTools::Download.new }
    it "has a url for #{version}" do
      expect(download.url).to_not be_nil
    end
  end
end
