AwsSnsKit.configure do |config|
  config.access_key_id = ''
  config.secret_access_key = ''
  config.region = ''
  config.endpoint = { 
    apns: '',
    apns_sandbox: '', 
    gcm: ''
  }
end
