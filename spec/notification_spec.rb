require 'spec_helper'

module AwsSnsKit
  describe Notification do
    let(:notification) { AwsSnsKit::Notification.new(Apns.new(OpenStruct.new)) }
    let(:platform) { notification.platform }

    describe '#platform' do
      it 'returns platform class instance' do
        expect(notification.platform).to an_instance_of(Apns)
      end
    end

    describe '#message' do
      it 'returns actual message by platform' do
        expect(notification.message).to eq(platform.message)
      end
    end
  end
end

