require 'aws-sdk'

module AwsSnsKit
  class Configuration
    attr_accessor :access_key_id, :secret_access_key, :region, :end_point

    def initialize
      @access_key_id = nil
      @secret_access_key = nil
      @region = 'us-east-1'
      @end_point = {}
    end

    def access_key_id=(value)
      AWS.config({access_key_id: value})
    end

    def access_key_id
      AWS.config.access_key_id
    end

    def secret_access_key=(value)
      AWS.config({secret_access_key: value})
    end

    def secret_access_key
      AWS.config.secret_access_key
    end

    def region=(value)
      AWS.config({region: value})
    end

    def region
      AWS.config.region
    end
  end
end
