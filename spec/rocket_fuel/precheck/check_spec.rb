require 'spec_helper'

require 'rocket_fuel/precheck'

describe RocketFuel::Precheck::Check do
  let(:check) { RocketFuel::Precheck::Check.new }
  let(:error_klass) { RocketFuel::NotImplementedError }
  it 'has a virtual method ok?' do
    expect(lambda { check.ok? }).to raise_error(error_klass)
  end

  it 'has a virtual method success_message' do
    expect(lambda { check.send(:success_message) }).to raise_error(error_klass)
  end

  it 'has a virtual method failure_message' do
    expect(lambda { check.send(:failure_message) }).to raise_error(error_klass)
  end
end
