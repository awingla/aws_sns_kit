# AwsSnsKit

## What is this?

AwsSnsKit is a solution for integrating Amazon Web Service(AWS) Simple Notification Service(SNS) into a Rails application.

## Installation

Add this line to your application's Gemfile:

    gem 'aws_sns_kit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws_sns_kit

## Configuration

Before using aws_sns_kit, you need to generate files using a generator.
Specify your model as first argument.

```ruby
rails generate aws_sns_kit:install MODEL_NAME
```

ex.
```ruby
rails generate aws_sns_kit:install User
```


This generator command create following files.


```ruby
config/initializers/aws_sns_kit.rb

db/migrate/20140715070941_add_aws_sns_kit_to_users.rb
```

Then, migrate.

```ruby
rake db:migrate
```

Also, you need to configure your initializer file.

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

You can use `push_notify` instance method with your model instance to send push notification via AWS SNS.
Before using this method, make sure that your model includes Notifier module from aws_sns_kit.

```ruby
class User < ActiveRecord::Base
  include AwsSnsKit::Notifier
end
```


Create a notification payload hash and send it by applying argument to `push_notify` method.

```ruby
user = User.first

notification = {
        alert: 'Message received via aws_sns_kit',
        sound: 'bingbong.aiff',
        badge: 2,
        content_available: 1,
        custom_data: { awesome: 'something' }
      }

user.push_notify(notification)
```

##### NOTE:
Since AWS SNS can send a notification to multiple platform, aws_sns_kit expect your MODEL to return the name of the platform when `sns_platform` method is called.
Specify your platform name from one of the following to your MODEL's attributes or instance method.

`[:apns, :apns_sandbox, :gcm]`


```ruby
# Set platform using model attribute

pry(main)> User.first.sns_platform
=> :apns

# Or specify it using instance method

class User < ActiveRecord::Base
  def sns_platform
    :apns
  end
end
```

#### GCM(Google Cloud Messaging)

Work in progress now.

#### Topics & Subscription

Work in progress now.

## Contributing

1. Fork it ( https://github.com/awingla/aws_sns_kit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
