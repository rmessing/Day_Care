class AddTeacherIdToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :teacher_id, :integer
  end
end
