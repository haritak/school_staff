class CreateTeacherSpecialties < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_specialties do |t|
      t.belongs_to :teacher, foreign_key: true
      t.belongs_to :specialty, foreign_key: true
      t.integer :priority

      t.timestamps
    end
  end
end
