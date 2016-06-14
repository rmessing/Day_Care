class CreateHandoffs < ActiveRecord::Migration
  def change
    create_table :handoffs do |t|
      t.string :type
      t.integer :child_id

      t.timestamps null: false
    end
  end
end
