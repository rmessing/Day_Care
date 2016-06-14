class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.integer :center_id
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
