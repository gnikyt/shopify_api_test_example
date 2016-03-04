# Shopify API Test Example

[![Build Status](https://secure.travis-ci.org/tyler-king/shopify_api_test_example
.svg?branch=master)](http://travis-ci.org/tyler-king/shopify_api_test_example
)

This repository outlines simple code on how to use mocks, fixtures, and tests, to test your Shopify API calls.

## Installation

```bash
git clone https://github.com/tyler-king/shopify_api_test_example.git
cd shopify_api_test_example
bundle install --path vendor/bundle
bundle exec rake SHOPIFY_SHOP=coolshop.myshop.com
```

## Final Thoughts

Take a look at the `test/metafields_test.rb` file for how to implement and expand upon the tests for your own applications.