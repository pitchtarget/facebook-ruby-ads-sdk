require 'facebook_ads/version'
require 'facebook_ads/client'

require 'facebook_ads/api'
require 'facebook_ads/object/abstract_crud_object'
require 'facebook_ads/object/ad_account'

module FacebookAds
  class << self
    attr_reader :client
    def configure(&block)
      block.call(config)
      @client = FacebookAds::Client.new(config.access_token)
    end

    def config
      @config ||= OpenStruct.new()
    end
  end
end
