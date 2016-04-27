class AddWorkgroupIdToDomains < ActiveRecord::Migration
  def change
    add_column :domains, :workgroup_id, :integer
  end
end
