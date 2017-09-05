class CreateSavedSchoolCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_school_courses do |t|
      t.belongs_to :school_class, foreign_key: true
      t.belongs_to :lesson, foreign_key: true
      t.integer :duration
      t.integer :save_no

      t.timestamps
    end
  end
end
