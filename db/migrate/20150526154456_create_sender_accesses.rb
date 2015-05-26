class CreateSenderAccesses < ActiveRecord::Migration
  def change
    create_table :sender_accesses do |t|
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
