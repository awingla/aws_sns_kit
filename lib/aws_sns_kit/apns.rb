module AwsSnsKit
  class Apns
    attr_accessor :alert, :sound, :badge, :content_available, :custom_data

    def initialize(options)
      @alert = options[:alert]
      @sound = options[:sound]
      @badge = options[:badge]
      @content_available = options[:content_available]
      @custom_data = options[:custom_data]
    end
    
    def message
    end
  end
end
