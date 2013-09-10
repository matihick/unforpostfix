class CreateSenderBccs < ActiveRecord::Migration
  def change
    create_table :sender_bccs do |t|
      t.string :from
      t.string :to
      t.boolean :enabled

      t.timestamps
    end
  end
end
