module FacebookAds
  module Object
    class AbstractCrudObject
      attr_reader :id, :client

      def initialize(client)
        @client = client
      end

      # Create object
      #
      # @return [FacebookAds::AbstractCrudObject]
      def create
        # TODO: check that Id is not set:  "Object has already an ID"

        # TODO: add the parent_object_id, validate it's presence
        # TODO: add the connection_name
        # @client.put_object(parent_object, connection_name, args = {}, options = {}, &block)
        #
        # TODO: clear history if the call succeed
      end

      # Read object data from the graph
      # @param [Array] fields Fields to request
      # @param [Hash] params Additional request parameters
      #
      # @return [FacebookAds::AbstractCrudObject]
      def read(fields:[], params:{})
        response = client.get_object(node_path, fields: fields.join(','))
      end

      def update
      end

      def delete
        # TODO: @graph.delete_object("2905623_123183957698327")
      end

      def node_path
        assure_id
      end

      def assure_id
        raise StandardError.new("Id is required") if id.nil?
        id
      end

      def data(json:)
        
      end

      def clear_history

      end
    end
  end
end
