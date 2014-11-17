module FacebookRubyAdsSdk
  module Object
    class AdAccount
      class << self
        alias_method :find, :new
      end

      attr_reader :account_id, :client

      def self.raw_data(client)
        client.get_connections('me', 'adaccounts')
      end

      def self.all(client)
        self.raw_data(client).map do |data|
          self.new data['account_id'], client
        end
      end

      def initialize(account_id, client)
        @account_id = account_id
        @client = client
      end

      def read(fields = %w{name balance})
        self.client.get_object("act_#{self.account_id}", fields: fields.join(','))
      end
    end
  end
end
