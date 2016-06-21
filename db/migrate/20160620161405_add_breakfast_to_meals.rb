class AddBreakfastToMeals < ActiveRecord::Migration
  def change
  	add_column :meals, :breakfast, :boolean
  	add_column :meals, :am_snack, :boolean
  	add_column :meals, :lunch, :boolean
  	add_column :meals, :pm_snack, :boolean
  	add_column :meals, :supper, :boolean
  	add_column :meals, :late_snack, :boolean
  end
end
