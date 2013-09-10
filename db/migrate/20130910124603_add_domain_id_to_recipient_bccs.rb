class AddDomainIdToRecipientBccs < ActiveRecord::Migration
  def change
    add_column :recipient_bccs, :domain_id, :integer
  end
end
