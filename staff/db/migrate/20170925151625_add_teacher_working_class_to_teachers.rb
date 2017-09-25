class AddTeacherWorkingClassToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_reference :teachers, :teacher_working_class, foreign_key: true
  end
end
