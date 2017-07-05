require 'minitest/autorun'
require 'webmock/minitest'
require 'shopify_api'
require_relative 'support/mock_support'

module Minitest
  class Test
    # Include our mock helpers
    include MockSupport
  end
end