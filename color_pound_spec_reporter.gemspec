# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'color_pound_spec_reporter/version'

Gem::Specification.new do |spec|
  spec.name          = "color_pound_spec_reporter"
  spec.version       = ColorPoundSpecReporter::VERSION
  spec.authors       = ["Daniel P. Clark"]
  spec.email         = ["6ftdan@gmail.com"]
  spec.summary       = %q{Modifies your SpecReporter for easy to follow colored output.}
  spec.description   = %q{SpecReporter with easy to follow colors.}
  spec.homepage      = "https://github.com/danielpclark/color_pound_spec_reporter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|example)/}) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.1'
  spec.add_dependency "bundler"
  spec.add_dependency "rake"
  spec.add_dependency "minitest"
  spec.add_dependency "minitest-reporters", ">= 0.14.24"
end
