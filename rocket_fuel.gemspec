# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rocket_fuel/version'

Gem::Specification.new do |spec|
  spec.name          = 'rocket_fuel'
  spec.version       = RocketFuel::VERSION
  spec.authors       = ['Dan Pickett']
  spec.email         = ['dan.pickett@launchacademy.com']
  spec.summary       = %q{A ruby client for installing rocket fuel}
  spec.description   = %q{A ruby client for installing rocket fuel.}
  spec.homepage      = ""
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
