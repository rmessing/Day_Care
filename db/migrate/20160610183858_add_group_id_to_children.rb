class AddGroupIdToChildren < ActiveRecord::Migration
  def change
  	add_column :children, :group_id, :integer
  end
end
