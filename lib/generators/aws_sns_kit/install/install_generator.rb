module AwsSnsKit
  module Generators
    class InstallGenerator < Rails::Generators::Base
      argument :model_name, type: :string, required: true

      def create_migration
        generate "migration", "add_aws_sns_kit_columns_to_#{table_name} device_token:string platform_endpoint:string" 
      end

      private
      def table_name
        model_name.constantize.table_name
      end
    end
  end
end
