class CreateApiClients < ActiveRecord::Migration
  def change
    create_table :api_clients do |t|
      t.string :name
      t.text :access_token
      t.boolean :enabled
      t.text :observations

      t.timestamps null: false
    end
  end
end
