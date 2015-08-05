require 'spec_helper'

describe FacebookAds::Object::AbstractCrudObject do
  describe '#create' do

  end

  describe '#read' do
    let(:client)   { FacebookAds::Client.new(test_facebook_token) }
    let(:object) { FacebookAds::Object::AbstractCrudObject.new(client) }

    it "reads object fields" do
      fake_id = 'fake_id'
      allow(object).to receive(:id) { fake_id }
      #expect(client).to receive(:get_object)
      #expect(object).to receive(:set_data)
      #expect(object).to receive(:clear_history)
      object.read
    end
  end

  describe '#update' do

  end

  describe '#delete' do

  end

  describe '#node_path' do
    let(:client)   { FacebookAds::Client.new(test_facebook_token) }
    let(:object) { FacebookAds::Object::AbstractCrudObject.new(client) }
    subject(:node_path) { object.node_path }

    context "Has an id" do
      it 'return the id as String'do
        fake_id = 'fake_id'
        allow(object).to receive(:id) { fake_id }
        is_expected.to be_kind_of String
        is_expected.to be == fake_id
      end
    end

    context "when don't have an id" do
      it 'raise an exception' do
        expect{node_path}.to raise_error(StandardError)
      end
    end
  end
end
