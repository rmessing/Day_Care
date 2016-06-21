class RemovePmSnackFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :pm_snack, :boolean
  end
end
