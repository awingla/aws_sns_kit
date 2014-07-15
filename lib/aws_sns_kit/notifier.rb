module AwsSnsKit
  module Notifier
    def push_notify(options = {}, platform = nil) 
      notification = ::Notification.new(options, platform)
      AwsClient.new(self, notification).publish
    end
  end
end
