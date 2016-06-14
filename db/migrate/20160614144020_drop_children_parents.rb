class DropChildrenParents < ActiveRecord::Migration
  def up
  	drop_table :children_parents
  end
end
