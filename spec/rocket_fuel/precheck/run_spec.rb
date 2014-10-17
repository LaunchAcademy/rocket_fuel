require 'spec_helper'

require 'rocket_fuel/precheck'

describe RocketFuel::Precheck::Run do
  it 'returns results' do
    results = capture(:stdout) { RocketFuel::Precheck::Run.new.results }
    expect(results).to_not eq('')
  end
end
