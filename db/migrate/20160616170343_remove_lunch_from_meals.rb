class RemoveLunchFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :lunch, :boolean
  end
end
