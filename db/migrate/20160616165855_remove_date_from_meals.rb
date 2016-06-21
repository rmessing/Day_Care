class RemoveDateFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :date, :string
  end
end
