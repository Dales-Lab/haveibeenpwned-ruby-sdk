require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'test/unit'
require 'mocha/setup'

require 'have_i_been_pwned'