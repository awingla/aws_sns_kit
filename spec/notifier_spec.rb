require 'spec_helper'

module AwsSnsKit
  describe Notifier do

    before :each do
      ActiveRecord::Base.establish_connection(
        adapter: 'sqlite3',
        database: ':memory:'
      )

      ActiveRecord::Schema.define do
        create_table :users, force: true do |t|
          t.string :device_token, default: "<abcde7a2 f8f9aay5 81b9b988 46hb15ca a15ea931 900cfa9c 178eaebf c2cb6702>"
          t.string :platform, default: 'ios'
        end
      end
    end

    describe '#push_notify' do
      before :each do
        class ::User < ActiveRecord::Base
          include AwsSnsKit::Notifier
        end
      end

      it 'send push_notification to instance device_token'
    end

  end
end
