require 'helper'

class TestPostcodeanywhere < Test::Unit::TestCase

  def setup
    flunk "You gotta provide some postcode anywhere account details details (see test)" unless ENV['TEST_PCA_ACCOUNT'] && ENV['TEST_PCA_LICENSE']
    PostcodeAnywhere::Request.account_code = ENV['TEST_PCA_ACCOUNT']
    PostcodeAnywhere::Request.license_code = ENV['TEST_PCA_LICENSE']
  end

  def test_we_are_in_ruby2
    assert_match /^2/, RUBY_VERSION
  end

  def test_lookup # does lookup work?
    res = PostcodeAnywhere::PostcodeSearch.new(:country_code=> 'GB', :postcode => 'MK5 8FT').lookup
    assert_kind_of Array, res
  end

  def test_fetch # does fetch work?
    res = PostcodeAnywhere::PostcodeSearch.new(:country_code=> 'GB', :fetch_id => '50737583.00').fetch
    assert_kind_of PostcodeAnywhere::AddressLookup, res
  end

end

