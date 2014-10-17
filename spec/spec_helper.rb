require 'rspec'

require 'rocket_fuel'

require 'mocha/api'

begin
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  SimpleCov.start
rescue
end

RSpec.configure do |config|
  #capture method courtesy of https://github.com/docwhat/homedir/blob/homedir3/spec/spec_helper.rb
  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end
    result
  end

  config.mock_with :mocha
end
