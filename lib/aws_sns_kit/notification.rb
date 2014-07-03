module AwsSnsKit
  class Notification
    attr_accessor :platform
    def initialize(platform)
      @platform = platform
    end

    def message
      platform.message
    end
  end
end

