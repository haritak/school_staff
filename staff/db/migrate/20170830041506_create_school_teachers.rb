class CreateSchoolTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :school_teachers do |t|
      t.belongs_to :teacher, foreign_key: true
      t.belongs_to :school, foreign_key: true
      t.integer :disposal_duration

      t.timestamps
    end

    add_index :school_teachers, [:teacher_id, :school_id],
      unique: true,
      name: "school_teachers_uniqness"
  end
end
