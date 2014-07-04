module AwsSnsKit
  module Notifier
    def push_notify(options = {}, platform = nil) 
      notification = ::Notification.new(options, platform)
      AwsClient.publish(notification)
    end
  end
end
