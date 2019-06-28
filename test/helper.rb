require 'simplecov'
# SimpleCov.start
SimpleCov.start 'rails' do
    add_filter "/test/"
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'test/unit'
require 'mocha/setup'

require 'have_i_been_pwned'
require 'version'