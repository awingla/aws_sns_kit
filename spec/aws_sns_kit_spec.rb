require 'spec_helper'
require 'aws-sdk'

describe AwsSnsKit do
  describe '#configure' do
    let (:access_key_id) { 'AOIJOJOFIEJOWJILJFQW' }
    let (:secret_access_key) { 'LSKGmpBV/CqRUTLUFCDcQBRRFRFKHO3DRbfpQB8h' }
    let (:region) { 'ap-northeast-1' }
    let (:endpoint) { 
      {
        apns: 'arn:aws:sns:ap-northeast-1:99999999999:app/APNS_SANDBOX/aws_sns_kit-iOS', 
        apns_sandbox: 'arn:aws:sns:ap-northeast-1:99999999999:app/APNS_SANDBOX/aws_sns_kit-iOS-Sandbox', 
        gcm: 'arn:aws:sns:ap-northeast-1:999999999999:app/GCM/aws_sns_kit-Android'
      }
    }
    let(:notification) { AwsSnsKit::Notification.new({}, :apns) }
    let(:configuration) { AwsSnsKit.configuration }

    before do
      AwsSnsKit.configure do |config|
        config.access_key_id = access_key_id
        config.secret_access_key = secret_access_key 
        config.region = region
        config.end_point = endpoint
      end
    end
      
    it 'set configuration with id and secret' do
      expect(configuration.access_key_id).to eq(access_key_id)
      expect(configuration.secret_access_key).to eq(secret_access_key)
    end
  end
end
