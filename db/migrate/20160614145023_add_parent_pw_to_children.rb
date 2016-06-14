class AddParentPwToChildren < ActiveRecord::Migration
  def change
  	add_column :children, :parentpw, :string
  end
end
