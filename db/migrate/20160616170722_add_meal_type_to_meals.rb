class AddMealTypeToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :meal_type, :integer
  end
end
