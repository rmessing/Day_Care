class AddMealsToCenters < ActiveRecord::Migration
  def change
  	add_column :centers, :breakfast, :boolean
  	add_column :centers, :am_snack, :boolean
  	add_column :centers, :lunch, :boolean
  	add_column :centers, :pm_snack, :boolean
  	add_column :centers, :supper, :boolean
  	add_column :centers, :late_snack, :boolean
  end
end
