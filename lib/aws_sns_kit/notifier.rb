module AwsSnsKit
  module Notifier
    def push_notify(options = {}) 
      notification = Notification.new(options, self.sns_platform)
      AwsClient.new(self, notification).publish
    end
  end
end
