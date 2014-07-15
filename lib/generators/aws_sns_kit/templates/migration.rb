class AddAwsSnsKitTo<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    change_table(:<%= table_name %>) do |t|
      t.string :device_token, unique: true
      t.string :platform_endpoint, unique: true
      t.string :sns_custom_data
      t.string :sns_platform
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end

