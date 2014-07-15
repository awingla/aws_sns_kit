AwsSnsKit.configure do |config|
  config.access_key_id = ''
  config.secret_access_key = ''
  config.region = ''
  config.end_point = { 
    apns: '',
    apns_sandbox: '', 
    gcm: ''
  }
end
