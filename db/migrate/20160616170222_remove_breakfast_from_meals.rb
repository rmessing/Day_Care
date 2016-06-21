class RemoveBreakfastFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :breakfast, :boolean
  end
end
