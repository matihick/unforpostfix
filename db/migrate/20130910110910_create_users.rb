class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :domain_id
      t.string :name
      t.string :email
      t.string :password
      t.boolean :enabled

      t.timestamps
    end
  end
end
