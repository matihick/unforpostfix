class CreateRecipientBccs < ActiveRecord::Migration
  def change
    create_table :recipient_bccs do |t|
      t.string :from
      t.string :to
      t.boolean :enabled

      t.timestamps
    end
  end
end
