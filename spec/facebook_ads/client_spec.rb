require 'spec_helper'

describe FacebookAds::Client do
  it 'mimics a Koala::Facebook::API' do
    client = FacebookAds::Client.new('foo')
    expect(client.access_token).to eq('foo')
  end
end
