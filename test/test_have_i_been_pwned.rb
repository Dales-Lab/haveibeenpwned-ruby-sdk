require 'helper'

class HolaTest < Test::Unit::TestCase #Minitest::Test
  def test_abc123_is_found
    assert_equal true, HaveIBeenPwned::pwned('abc123')
  end

  def test_password_is_found
    assert_equal true, HaveIBeenPwned::pwned('password')
  end

  def test_crazy_long_password_is_not_found
    assert_equal false, HaveIBeenPwned::pwned('dfsfk;lngfdsjlmkvsdlmjkvf8um54b89u5438mu0p435u0m5b409u54b09um5309um50u9m3b56u90m54jmgtrgv')
  end

  def test_not_actually_providing_a_password_is_silly
    assert_equal false, HaveIBeenPwned::pwned('')
  end
end
