class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :abbr
      t.string :description
      t.integer :hours
      t.belongs_to :lesson_type
      t.belongs_to :school_grade_specialty

      t.timestamps
    end
    add_index :lessons, :abbr, unique: true
  end
end
