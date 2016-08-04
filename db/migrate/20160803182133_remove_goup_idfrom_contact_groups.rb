class RemoveGoupIdfromContactGroups < ActiveRecord::Migration
  def change
    remove_column :contact_groups, :goup_id, :integer
  end
end
