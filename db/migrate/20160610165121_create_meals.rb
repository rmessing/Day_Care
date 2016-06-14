class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :date
      t.boolean :breakfast
      t.boolean :am_snack
      t.boolean :lunch
      t.boolean :pm_snack
      t.boolean :supper
      t.boolean :late_snack
      t.integer :child_id
      t.string :signature

      t.timestamps null: false
    end
  end
end
