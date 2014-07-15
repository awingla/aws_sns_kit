module AwsSnsKit
  class AwsClient
    def initialize(instance, notification)
      @client_wrapper = AWS::SNS.new.client
      @instance = instance
      @notification = notification
    end

    def publish
      @client_wrapper.publish(target_arn: @instance.platform_endpoint, message: @notification.message, message_structure: :json)
    rescue => e
      if e.class == AWS::SNS::Errors::EndpointDisabled
        retry if enable?
      end
    end

    def enable?
    end
  end
end
