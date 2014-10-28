module Kangoo
  class Api
    attr_reader :client, :http

    def initialize(auth_token)
      @client = Client.new(auth_token)
    end

    def find_ad_account(account_id)
      AdAccount.new(account_id, self.client)
    end

    def ad_accounts
      AdAccount.all(self.client)
    end
  end
end