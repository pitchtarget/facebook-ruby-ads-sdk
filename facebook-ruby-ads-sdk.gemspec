# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'facebook-ruby-ads-sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "facebook-ruby-ads-sdk"
  spec.version       = FacebookRubyAdsSdk::VERSION
  spec.authors       = ["Andrea Dal Ponte", "Nicola Brisotto"]
  spec.email         = ["info@andreadalponte.com"]
  spec.summary       = %q{Facebook Ads API SDK for Ruby}
  spec.description   = %q{Facebook Ads API SDK for Ruby}
  spec.homepage      = "https://github.com/pitchtarget/facebook-ruby-ads-sdk"
  spec.license       = "Apache version 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "koala"

  spec.add_development_dependency "bundler", ">= 1.6"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency 'rspec',   '~> 3.1.0'
  spec.add_development_dependency 'webmock', '~>1.20.0'
  spec.add_development_dependency 'vcr',     '~> 2.9.3'
  spec.add_development_dependency 'dotenv'

end
