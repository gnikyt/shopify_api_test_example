module MockSupport
  # Reads the fixure file for an endpoint
  # @param [String] method the method to use
  # @param [String] endpoint the API endpoint
  # @return [String] the file
  # @example
  #   load_fixture :get, :metafields # loads test/fixtures/get_metafields.json
  #   load_fixture :post, :products # loads test/fixtures/post_products.json
  def load_fixture(method, endpoint)
    File.read(File.join('test', 'fixtures', "#{method.to_s}_#{endpoint.to_s.gsub("/", "_")}.json"))
  end
  
  # Helper to tell webmock to mock a request and load its fixture
  # @param [String] method the medthod to use
  # @param [String] endpoint the API endpoint
  # @example
  #   mock :get, :metafields
  def mock(method, endpoint)
    url   = "https://#{ENV["SHOPIFY_SHOP"]}/admin/#{endpoint}.json"
    body  = load_fixture method, endpoint
    
    stub_request(method, url).to_return(body: body, status: 200)
  end
end