class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :food_subsidy

      t.timestamps null: false
    end
  end
end
