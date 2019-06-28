require 'helper'

class VersionTest < Test::Unit::TestCase
    def test_version_valid
        assert_match(/^\d+.\d+.\d$/, HaveIBeenPwned::version)
    end

    def test_version_exists
        # const = HaveIBeenPwned::VERSION
        # puts ""
        # puts Object.const_defined?(HaveIBeenPwned::VERSION)
        # puts ""
        # assert_equal("constant", Object.const_defined?(const.to_s))
        assert_not_nil(HaveIBeenPwned::version)
    end
end