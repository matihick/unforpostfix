class AddDomainIdToSenderBccs < ActiveRecord::Migration
  def change
    add_column :sender_bccs, :domain_id, :integer
  end
end
