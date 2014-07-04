# AwsSnsKit

THIS PROJECT IS NOW WORK IN PROGRESS AND SHOULD NOT BE USED IN PRODUCTION.


## Installation

Add this line to your application's Gemfile:

    gem 'aws_sns_kit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws_sns_kit

## Usage

### How to use?

You can use `push_notify` instance method with your model instance to send push notification via aws SNS.
Before using this method, make sure that your model includes module from aws_sns_kit.

```ruby
class User < ActiveRecord::Base
  include AwsSnsKit::Notifier
end
```

In default, this gem assumes that your model has the `device_token` attribute.
You can change default by using configuration.

TODO:

Here is exapmle.

#### APNS(Apple Push Notification Service)

```ruby
user = User.first

notification_info = {
        alert: 'Message received via aws_sns_kit',
        sound: 'bingbong.aiff',
        badge: 2,
        content_available: 1,
        custom_data: { awesome: 'something' }
      }

user.push_notify(notification_info, :apns)
```

`push_notify` method takes first argument as notification hash. Specify your custom information here.

Second argument is optional. In default, this gem expect your model instance to respond `platform` instance method or attribute.

If you want to change default value, please use configuration.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/aws_sns_kit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
