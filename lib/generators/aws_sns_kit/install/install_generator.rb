require 'rails/generators/active_record'

module AwsSnsKit
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def create_migration_file
        migration_template "migration.rb", "db/migrate/add_device_to_#{table_name}.rb"
      end

      private
      def table_name
        name.constantize.table_name
      end
    end
  end
end

