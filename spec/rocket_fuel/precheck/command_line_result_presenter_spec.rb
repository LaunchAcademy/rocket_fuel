require 'spec_helper'

require 'rocket_fuel/precheck/command_line_result_presenter'

describe RocketFuel::Precheck::CommandLineResultPresenter do
  let(:success_icon) do
    RocketFuel::Precheck::CommandLineResultPresenter::SUCCESS_ICON
  end

  let(:failure_icon) do
    RocketFuel::Precheck::CommandLineResultPresenter::FAILURE_ICON
  end

  it 'includes the message' do
    message = 'clearance granted.'
    result = RocketFuel::Precheck::CheckResult.new(true, message)
    presented_result = RocketFuel::Precheck::CommandLineResultPresenter.new(result)
    expect(capture(:stdout) { presented_result.present }).to include(message)
  end

  it 'starts with a success icon if the result is successful' do
    result = RocketFuel::Precheck::CheckResult.new(true, 'clearance granted.')
    presented_result = RocketFuel::Precheck::CommandLineResultPresenter.new(result)
    expect(capture(:stdout) { presented_result.present }).to include(success_icon)
  end

  it 'starts with a failure icon if the result is not successful' do
    result = RocketFuel::Precheck::CheckResult.new(false, 'clearance granted.')
    presented_result = RocketFuel::Precheck::CommandLineResultPresenter.new(result)
    expect(capture(:stdout) { presented_result.present }).to include(failure_icon)
  end
end
