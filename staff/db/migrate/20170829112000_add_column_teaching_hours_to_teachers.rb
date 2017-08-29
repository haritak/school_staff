class AddColumnTeachingHoursToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :teaching_hours, :integer
  end
end
