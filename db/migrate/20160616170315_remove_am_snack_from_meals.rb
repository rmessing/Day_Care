class RemoveAmSnackFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :am_snack, :boolean
  end
end
