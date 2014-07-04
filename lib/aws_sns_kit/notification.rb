module AwsSnsKit
  class Notification

    def initialize(options, platform_symbol)
      @options = OpenStruct.new(options)
      @platform_symbol = platform_symbol
    end

    def message
      platform.message
    end

    def platform
      @platform = Apns.new(@options)
    end
  end
end

