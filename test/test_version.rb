require 'helper'

class VersionTest < Test::Unit::TestCase
    def test_version_valid
        assert_match(/^\d+.\d+.\d$/, HaveIBeenPwned::VERSION)
    end
end