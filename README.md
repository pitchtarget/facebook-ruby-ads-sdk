# Facebook Ruby Ads Sdk

[![Build Status](https://travis-ci.org/pitchtarget/facebook-ruby-ads-sdk.svg)](https://travis-ci.org/pitchtarget/facebook-ruby-ads-sdk)
[![Code Climate](https://codeclimate.com/github/pitchtarget/facebook-ruby-ads-sdk/badges/gpa.svg)](https://codeclimate.com/github/pitchtarget/facebook-ruby-ads-sdk)
[![Test Coverage](https://codeclimate.com/github/pitchtarget/facebook-ruby-ads-sdk/badges/coverage.svg)](https://codeclimate.com/github/pitchtarget/facebook-ruby-ads-sdk)
[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/pitchtarget/facebook-ruby-ads-sdk)

Facebook Ads API SDK for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'facebook_ads'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install facebook_ads

## Usage

### Configuring the default Facebook client

In order to talk to Facebook, you need to provide a valid access token and instruct facebook_ads to use it.

```ruby
FacebookAds.configure do |config|
  config.access_token = 'MY_ACCESS_TOKEN'
end
```

## Development and Run Test

Due to a [bug in bundler](http://stackoverflow.com/questions/4118055/rails-bundler-doesnt-install-gems-inside-a-group) to install the debug group you need to run:

```
bundle install --without nothing
```

To run all tests: `rake`

### Internals



## Contributing

1. Fork it ( https://github.com/[my-github-username]/facebook-ruby-ads-sdk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
