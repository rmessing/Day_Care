class RemoveParentPwFromChildren < ActiveRecord::Migration
  def change
    remove_column :children, :parentpw, :string
  end
end
