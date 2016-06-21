class RemoveSupperFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :supper, :boolean
  end
end
