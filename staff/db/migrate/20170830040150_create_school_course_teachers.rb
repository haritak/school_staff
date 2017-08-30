class CreateSchoolCourseTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :school_course_teachers do |t|
      t.belongs_to :school_course, foreign_key: true
      t.belongs_to :teacher, foreign_key: true

      t.timestamps
    end
  end
end
