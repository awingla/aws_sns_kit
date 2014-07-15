require 'rails/generators/active_record'

module AwsSnsKit
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def create_migration_file
        migration_template "migration.rb", "db/migrate/add_aws_sns_kit_to_#{table_name}.rb"
      end

      def create_initialize_file
        template "initializer.rb", "config/initializers/aws_sns_kit.rb"
      end

      private

      def table_name
        name.constantize.table_name
      end
    end
  end
end

