require 'spec_helper'

module AwsSnsKit
  describe Apns do
    let(:apns_options) {
      OpenStruct.new({
        alert: 'Message received via aws_sns_kit',
        sound: 'bingbong.aiff',
        badge: 9,
        content_available: 1,
        custom_data: { awesome: 'something' }
      })
    }

    let(:apns) { AwsSnsKit::Apns.new(apns_options) }

    describe '#alert' do
      it { expect(apns.alert).to eq(apns_options.alert) } 
    end

    describe '#sound' do
      it { expect(apns.sound).to eq(apns_options.sound) } 
    end

    describe '#badge' do
      it { expect(apns.badge).to eq(apns_options.badge) } 
    end

    describe '#content_available' do
      it { expect(apns.content_available).to eq(apns_options.content_available) } 
    end

    describe '#custom_data' do
      it { expect(apns.custom_data).to eq(apns_options.custom_data) } 
    end

    describe '#message' do
      it 'returns actual message combined with attributes ' do
      end
    end
  end
end

