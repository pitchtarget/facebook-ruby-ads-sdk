module FacebookAds
  module Object
    class AdAccount < AbstractCrudObject
      attr_reader :account_id

      def self.raw_data(client)
        client.get_connections('me', 'adaccounts')
      end

      def self.all(client)
        raw_data(client).map do |data|
          new data['account_id'], client
        end
      end

      def initialize(account_id, client)
        super(client)
        @account_id = account_id
      end

      def id
        "act_#{account_id}"
      end

      # time_ranges [{'since': '2015-01-01', 'until': '2015-01-01'}, {'since': '2015-01-02', 'until': '2015-01-02'}]
      #

      #https://github.com/arsduo/koala/wiki/Graph-API
      #{limit: @options[:max_items],
      #                      fields: ['message', 'id', 'from', 'type',
      #                               'picture', 'link', 'created_time', 'updated_time'
      #                      ]}

      # level: 'adgroup', 'campaign', 'campaign_group', 'account'
      # contraints: only one
      #
      # action_attribution_windows 
      # contraints: array of string
      #
      # breakdowns: 'age', 'country', 'gender', 'impression_device', 'placement', 'region', 'product_id', 'hourly_stats_aggregated_by_advertiser_time_zone', 'hourly_stats_aggregated_by_audience_time_zone'
      # costraints: list of string
      # costraints: Does not support more than one breakdown, except 'age + gender', 'impression_device + placement'. 'impression_device' cannot be used alone.
      #
      #
      # action_breakdowns : 'action_type', 'action_target_id', 'action_destination', 'action_device', 'action_video_type', 'action_carousel_card_id', 'action_carousel_card_name'
      # costraints: array of string
      # Support more than one breakdowns. Default value is action_type.

      BREAKDOWNS = [ 'age', 'country', 'gender', 'impression_device', 'placement', 'region', 'product_id', 'hourly_stats_aggregated_by_advertiser_time_zone', 'hourly_stats_aggregated_by_audience_time_zone' ]
      LEVELS = ['adgroup', 'campaign', 'campaign_group', 'account']

      def insights(fields: [], time_ranges: "", level: "", breakdowns: [], action_breakdowns: [],
                   action_attribution_windows: ['default'], filtering: [] )
        #args is an hash of query parms
        args = {}
        unless time_ranges.empty?
          args[:time_ranges] = time_ranges
        end

        unless level.empty?
          raise "invalid level: #{level}" unless LEVELS.include? level
          args[:level] = level
        end

        unless action_attribution_windows.empty?
          args[:action_attribution_windows] = action_attribution_windows
        end

        unless fields.empty?
          args[:fields] = fields.join(',')
        end

        unless breakdowns.empty?
          #raise "The api support only one breakdown, the param is: #{breakdowns}" unless breakdowns.size <= 1
          #raise "invalid breakdown: #{breakdowns}" unless BREAKDOWNS.include? breakdowns[0]

          args[:breakdowns] = breakdowns
        end

        unless action_breakdowns.empty?
          args[:action_breakdowns] = action_breakdowns
        end

        unless filtering.empty?
          args[:filtering] = filtering
        end


        client.get_connection(id, 'insights', args)
      end

#      def read(fields:[], params:{})
#        response = client.get_object(node_path, fields: fields.join(','))
#      end


    end
  end
end
