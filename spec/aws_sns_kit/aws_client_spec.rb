require 'spec_helper'
require 'rspec-activemodel-mocks'

module AwsSnsKit
  describe AwsClient do
    let(:instance) { mock_model(
      'User', 
      save!: true,
      platform_endpoint?: true,
      platform_endpoint: '',
      sns_platform: :apns,
      device_token: ''
    )}

    before :each do
      AWS.config({
        access_key_id: '1',
        secret_access_key: 'awesome',
        region: 'us-east-1'
       })
      AWS.stub! 
      allow(instance).to receive(:platform_endpoint=)
    end

    let(:notification) { notification_info = {
        alert: 'Message received via aws_sns_kit',
        sound: 'bingbong.aiff',
        badge: 2,
        content_available: 1,
        custom_data: { awesome: 'something' }
      }
      Notification.new(notification_info, :apns) 
    }

    let(:client) { AwsSnsKit::AwsClient.new(instance, notification) }

    describe '#publish' do
      it 'sends message to AWS SNS' do
        expect(client.publish.data).to eq(AWS::Core::Response.new.data)
      end
    end

    describe '#create_endpoint' do
      before :each do
        response = client.client_wrapper.stub_for(:create_platform_endpoint)
        response.data[:endpoint_arn] = 'endpoint_arn'
      end

      it 'saves endpoint to instance' do
        expect(client.instance_eval{ create_endpoint }).not_to eq(instance.platform_endpoint == 'endpoint_arn') 
      end
    end
  end
end

