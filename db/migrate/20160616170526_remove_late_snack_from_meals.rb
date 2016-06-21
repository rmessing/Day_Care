class RemoveLateSnackFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :late_snack, :boolean
  end
end
