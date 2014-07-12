require 'spec_helper'

describe AwsSnsKit do
  describe '#configure' do
    let (:access_key_id) { 'AOIJOJOFIEJOWJILJFQW' }
    let (:access_key_secret) { 'LSKGmpBV/CqRUTLUFCDcQBRRFRFKHO3DRbfpQB8h' }
    let (:region) { 'ap-northeast-1' }
    let (:endpoint) { 
      {
        apns: 'arn:aws:sns:ap-northeast-1:99999999999:app/APNS_SANDBOX/aws_sns_kit-iOS', 
        apns_sandbox: 'arn:aws:sns:ap-northeast-1:99999999999:app/APNS_SANDBOX/aws_sns_kit-iOS-Sandbox', 
        gcm: 'arn:aws:sns:ap-northeast-1:999999999999:app/GCM/aws_sns_kit-Android'
      }
    }
    let(:notification) { AwsSnsKit::Notification.new({}, :apns) }

    before do
      AwsSnsKit.configure do |config|
        config.access_key_id = access_key_id
        config.secret_access_key = access_key_secret
        config.region = region
        config.end_point = endpoint
      end
    end
      
    it 'set AWS.config with id and secret' do
      expect(AWS.config.access_key_id).to eq(access_key_id)
      expect(AWS.config.access_key_secret).to eq(acess_key_secret)
    end

  end
end

