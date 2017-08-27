class CreateLessonAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_assignments do |t|
      t.belongs_to :lesson, foreign_key: true
      t.belongs_to :specialty, foreign_key: true
      t.integer :priority
      t.text :reference

      t.timestamps
    end
    add_index :lesson_assignments, 
      [:lesson_id, :specialty_id, :priority], 
      unique: true,
      name: "uniqness_of_lesson_assignments"
  end
end
