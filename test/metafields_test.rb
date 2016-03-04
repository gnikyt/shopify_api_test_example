require_relative "test_helper"

class Test < Minitest::Test
  def setup
    # Flunk for missing env for shop
    flunk "Missing SHOPIFY_SHOP env variable" unless ENV.has_key?("SHOPIFY_SHOP")
    
    # Setup a dummy session for the API
    ShopifyAPI::Base.clear_session
    ShopifyAPI::Base.site     = "https://#{ENV["SHOPIFY_SHOP"]}/admin"
    ShopifyAPI::Base.password = nil
    ShopifyAPI::Base.user     = nil
  end
  
  def test_get_two_metafields_with_the_correct_keys
    # Mock metafields and load the fixture
    mock :get, :metafields
    
    # Returns our fixture data
    metafields = ShopifyAPI::Metafield.all

    assert_equal 2, metafields.size
    assert_equal ["app_key", "phone"], metafields.collect(&:key).to_a
  end
end