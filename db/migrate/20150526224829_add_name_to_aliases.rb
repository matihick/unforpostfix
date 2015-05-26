class AddNameToAliases < ActiveRecord::Migration
  def change
    add_column :aliases, :name, :string
  end
end
