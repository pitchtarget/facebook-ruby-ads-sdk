require 'koala'
Koala.config.api_version = 'v2.4'

module FacebookAds
  class Client < SimpleDelegator
    def initialize(facebook_token)
      client = Koala::Facebook::API.new(facebook_token)
      super(client)
    end
  end
end
