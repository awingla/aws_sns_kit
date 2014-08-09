module AwsSnsKit
  class AwsClient
    attr_reader :client_wrapper, :instance, :notification

    def initialize(instance, notification)
      @client_wrapper = AWS::SNS.new.client
      @instance = instance
      @notification = notification
    end

    def publish
      client_wrapper.publish(target_arn: platform_endpoint, message: notification.message, message_structure: "json")
    rescue AWS::SNS::Errors::EndpointDisabled
      retry if enable
    end

    private

    def enable
      client_wrapper.set_endpoint_attributes({
        attributes: { "Enabled" =>  "true", "CustomUserData" => instance.sns_custom_data}, 
        endpoint_arn: platform_endpoint
      })
    end

    def create_endpoint
      arn = AwsSnsKit.configuration.end_point(instance.sns_platform)
      response = client_wrapper.create_platform_endpoint(
        platform_application_arn: arn, 
        token: instance.device_token
      )
      instance.platform_endpoint = response[:endpoint_arn]
      instance.save!
    end

    def platform_endpoint
      if publishable?
        instance.platform_endpoint
      else 
        if create_endpoint
          instance.platform_endpoint
        end
      end
    end
    
    def publishable?
      instance.platform_endpoint?
    end
  end

end
