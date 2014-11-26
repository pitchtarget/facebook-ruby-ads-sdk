module FacebookAds
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
        raw_data(client).map do |data|
          new data['account_id'], client
        end
      end

      def initialize(account_id, client)
        @account_id = account_id
        @client = client
      end

      def read(fields = %w(name balance))
        client.get_object("act_#{account_id}", fields: fields.join(','))
      end
    end
  end
end
