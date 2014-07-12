module AwsSnsKit
  describe Configuration do
    describe '#access_key_id' do
      it 'default value is empty string' do
        Configuration.new.access_key_id = ''
      end
    end
    
    describe '#access_key_id=' do
      it 'can set value' do
        config = Configuration.new
        config.access_key_id = 'AOIJOJOFIEJOWJILJFQW'
        expect(config.access_key_id).to eq('AOIJOJOFIEJOWJILJFQW')
      end
    end
  end
end
