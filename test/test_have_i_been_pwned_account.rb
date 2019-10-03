require 'helper'

class PwnedTest < Test::Unit::TestCase

  def test_my_email_is_found
    assert_not_nil HaveIBeenPwned.pwned_account('john@gmail.com') # just a very generic email that does fail
  end

  def test_account_timeout
    starting = Time.now
    result = HaveIBeenPwned.pwned_account('major.monkey.ha.not.been.hacked@gmail.com', timeout: 1)
    ending = Time.now
    elapsed = (ending - starting).floor

    assert_operator elapsed, :<=, 1
  end

  def test_my_email_is_not_found
    assert_nil HaveIBeenPwned.pwned_account('major.monkey.ha.not.been.hacked@gmail.com')
  end

  def test_bad_api_key_gives_error
    assert_raise("UncaughtThrowError") {
      assert_equal false, HaveIBeenPwned.pwned_account('major.monkey.ha.not.been.hacked@gmail.com', 'not_a_valid_api_key')
    }    
  end

  def test_no_password_at_all_raises
    assert_raise("ArgumentError") {
      HaveIBeenPwned.pwned
    }
  end
end
