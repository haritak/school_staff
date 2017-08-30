class ChangeTableSchoolCourseTeachers < ActiveRecord::Migration[5.1]
  def change
    drop_table :school_course_teachers
    create_table :school_course_teachers do |t|
      t.belongs_to :school_course, foreign_key: true
      t.belongs_to :school_teacher, foreign_key: true

      t.timestamps
    end
  end
end
