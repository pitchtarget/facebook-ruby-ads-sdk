require 'helper'

describe Kangoo::AdAccount do
  describe '.raw_data' do
    let(:client)   { Kangoo::Client.new(test_facebook_token) }
    subject(:data) { Kangoo::AdAccount.raw_data(client) }

    it do
      VCR.use_cassette 'ad_accounts' do
        is_expected.to be_kind_of Array
      end
    end
  end
end