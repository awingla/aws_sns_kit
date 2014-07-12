module AwsSnsKit
  module Notifier
    def push_notify(options = {}, platform = nil) 
      notification = ::Notification.new(options, platform)
      AwsClient.publish(self, notification)
    end
  end
end
