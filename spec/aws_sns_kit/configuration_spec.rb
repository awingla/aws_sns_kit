module AwsSnsKit
  describe Configuration do
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

    let(:configuration) { Configuration.new }

    describe 'access_key_id' do
      before :each do
        configuration.access_key_id = access_key_id
      end

      describe '#access_key_id' do
        it 'returns AWS.config.access_key_id' do
          expect(configuration.access_key_id).to eq(AWS.config.access_key_id)
        end
      end

      describe '#access_key_id=' do
        it 'can set value to AWS.config' do
          expect(AWS.config.access_key_id).to eq(access_key_id)
        end
      end
    end

    describe 'secret_access_key' do
      before :each do
        configuration.secret_access_key = secret_access_key
      end

      describe '#secret_access_key' do
        it 'returns AWS.config.secret_access_key' do
          expect(configuration.secret_access_key).to eq(AWS.config.secret_access_key)
        end
      end

      describe '#secret_access_key=' do
        it 'set AWS.config with id and secret' do
          expect(AWS.config.secret_access_key).to eq(secret_access_key)
        end
      end
    end

    describe 'region' do
      before :each do
        configuration.region = region
      end

      describe '#region' do
        it 'returns AWS.config.region' do
          expect(configuration.region).to eq(AWS.config.region)
        end
      end

      describe '#region=' do
        it 'returns AWS.config.region' do
          expect(AWS.config.region).to eq(region)
        end
      end
    end

  end
end
