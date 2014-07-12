require 'spec_helper'

module AwsSnsKit
  describe Notification do
    let(:notification) { AwsSnsKit::Notification.new(OpenStruct.new, :apns) }
    let(:platform) { notification.platform }

    describe '#message' do
      it 'returns actual message by platform' do
        expect(notification.message).to eq(platform.message)
      end
    end

    describe '#create_platform' do
      it 'create platform by platform argument' do
        expect(notification.platform).to be_an_instance_of(Apns)
      end
    end
  
  end
end

