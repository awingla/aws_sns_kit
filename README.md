# AwsSnsKit

#### THIS PROJECT IS NOW WORK IN PROGRESS AND SHOULD NOT BE USED IN PRODUCTION.

## What is this?

AwsSnsKit is a solution for integrating Amazon Web Service(AWS) Simple Notification Service(SNS) into Rails application.

## Installation

Add this line to your application's Gemfile:

    gem 'aws_sns_kit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws_sns_kit

## Configuration

Before using aws_sns_kit, you need to generate a file using generator.
Specify your model as first Argument.

```ruby
rails generate aws_sns_kit:install MODEL_NAME
```

ex.
```ruby
rails generate aws_sns_kit:install User
```


This generator command create following files.


`
config/initializers/aws_sns_kit.rb
db/migrate/20140715070941_add_aws_sns_kit_to_users.rb
`

Then, migrate.

```ruby
rake db:migrate
```

Also, you need to configure initializer file.

Following configuration is for using aws-sdk.
More information here. https://github.com/aws/aws-sdk-ruby

```ruby
#config/initializers/aws_sns_kit.rb

AwsSnsKit.configure do |config|
  config.access_key_id = 'your access_key_id here'
  config.secret_access_key = 'your secret_access_key here'
  config.region = 'your region here'

  #specify PlatformApplicationArn respectively.

  config.end_point = { 
    apns: '',
    apns_sandbox: '', 
    gcm: ''
  }
end

```


## How to use?

#### APNS(Apple Push Notification Service)

You can use `push_notify` instance method with your model instance to send push notification via aws SNS.
Before using this method, make sure that your model includes module from aws_sns_kit.

```ruby
class User < ActiveRecord::Base
  include AwsSnsKit::Notifier
end
```



```ruby
user = User.first

notification_info = {
        alert: 'Message received via aws_sns_kit',
        sound: 'bingbong.aiff',
        badge: 2,
        content_available: 1,
        custom_data: { awesome: 'something' }
      }

user.push_notify(notification_info)
```

`push_notify` method takes first argument as notification hash. Specify your custom information here.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/aws_sns_kit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
