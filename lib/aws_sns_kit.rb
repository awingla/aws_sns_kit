require 'aws_sns_kit/version'
require 'aws_sns_kit/notification'
require 'aws_sns_kit/apns'
require 'ostruct'
require 'aws_sns_kit/notifier'
require 'active_record'
require 'aws_sns_kit/aws_client.rb'
require 'generators'

begin
  require 'pry'
rescue LoadError
end

module AwsSnsKit
end
