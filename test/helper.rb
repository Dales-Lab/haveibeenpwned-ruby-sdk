require 'simplecov'
# SimpleCov.start
SimpleCov.start 'rails' do
    add_filter "/test/"
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require 'test/unit'
require 'mocha/setup'

require 'have-i-been-pwned'
require 'version'