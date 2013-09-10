class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.integer :domain_id
      t.string :from
      t.text :to
      t.boolean :enabled

      t.timestamps
    end
  end
end
