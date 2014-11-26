require 'spec_helper'

describe FacebookAds do
  describe '.configure' do
    before do
      FacebookAds.configure do |config|
        config.access_token = 'foo'
      end
    end

    subject { FacebookAds.client }

    it { is_expected.to_not be_nil }
  end
end
