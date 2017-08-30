class CreateSchoolCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :school_courses do |t|
      t.belongs_to :school_class, foreign_key: true
      t.belongs_to :lesson, foreign_key: true
      t.integer :duration, null: false, default: 1

      t.timestamps
    end
  end
end
