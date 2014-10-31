module Kangoo
  class AdAccount
    class << self
      def raw_data(client)
        client.get_connections('me', 'adaccounts')
      end

      def all(client)
        self.raw_data(client).map do |data|
          AdAccount.new data['account_id'], client
        end
      end
    end

    attr_reader :account_id, :client

    def initialize(account_id, client)
      @account_id = account_id
      @client = client
    end

    def read(fields = %w{name balance})
      self.client.get_object("act_#{self.account_id}", fields: fields.join(','))
    end
  end
end