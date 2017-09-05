class CreateSavedSchoolCourseTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_school_course_teachers do |t|
      t.belongs_to :saved_school_course, foreign_key: true
      t.belongs_to :school_teacher, foreign_key: true
      t.integer :save_no

      t.timestamps
    end
  end
end
