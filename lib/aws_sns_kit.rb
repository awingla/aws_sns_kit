require 'aws_sns_kit/version'
require 'aws_sns_kit/notification'
require 'aws_sns_kit/apns'
require 'ostruct'
require 'aws_sns_kit/notifier'
require 'active_record'
require 'aws_sns_kit/aws_client'
require 'aws_sns_kit/configuration'
j
begin
  require 'pry'
rescue LoadError
end

module AwsSnsKit
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
