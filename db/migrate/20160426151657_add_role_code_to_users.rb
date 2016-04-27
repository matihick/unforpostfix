class AddRoleCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_code, :string
  end
end
