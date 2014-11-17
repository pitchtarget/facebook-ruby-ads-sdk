require 'facebook-ruby-ads-sdk/client'
require 'facebook-ruby-ads-sdk/object/ad_account'

module FacebookRubyAdsSdk
  class Api
    attr_reader :client, :http

    def initialize(auth_token)
      @client = Client.new(auth_token)
    end

    def ad_accounts
      @ad_accounts ||= Object::AdAccount.all(client)
    end

    def find_ad_account(account_id)
      Object::AdAccount.find(account_id, client)
    end
  end
end
