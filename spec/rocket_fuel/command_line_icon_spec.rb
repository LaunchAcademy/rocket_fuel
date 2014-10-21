require 'spec_helper'

require 'rocket_fuel/command_line_icon'

describe RocketFuel::CommandLineIcon do
  let(:utf_char) { "\u2713" }
  let(:fallback) { '[ok]' }

  let(:icon) { RocketFuel::CommandLineIcon.new(utf_char, fallback) }

  it 'renders the fallback if encoding is not supported' do
    icon.expects(:fallback?).returns(true)
    expect(icon.render).to eq(fallback)
  end
  
  it 'renders the icon if encoding is supported' do
    expect(icon.render).to eq(utf_char.encode('utf-8'))
  end
end
