class CreateClientAccesses < ActiveRecord::Migration
  def change
    create_table :client_accesses do |t|
      t.string :name
      t.string :status
      t.string :reject_note
      t.string :rule
      t.text :observations
      t.boolean :enabled

      t.timestamps
    end
  end
end
