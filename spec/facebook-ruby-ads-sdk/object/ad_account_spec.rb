require 'helper'

describe FacebookRubyAdsSdk::Object::AdAccount do
  describe '.raw_data', vcr: { cassette_name: :ad_accounts } do
    let(:client)   { FacebookRubyAdsSdk::Client.new(test_facebook_token) }
    subject(:data) { FacebookRubyAdsSdk::Object::AdAccount.raw_data(client) }

    it 'shoul be an array' do
      is_expected.to be_kind_of Array
    end
  end

  describe '.all' do
  end
end
