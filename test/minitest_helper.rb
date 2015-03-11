$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'color_pound_spec_reporter'

require 'minitest/autorun'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

Minitest::Reporters.use! [ColorPoundSpecReporter.new]

