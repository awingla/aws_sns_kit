class AddAwsSnsKitTo<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    change_table(:<%= table_name %>) do |t|
      t.string :device_token, unique: true
      t.string :platform_endpoint, unique: true
      t.stirng :sns_custom_data
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end

