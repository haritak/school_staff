class CreateSchoolGradeSpecialties < ActiveRecord::Migration[5.1]
  def change
    create_table :school_grade_specialties do |t|
      t.string :code
      t.string :description
      t.references :schoolgrade, foreign_key: true

      t.timestamps
    end
    add_index :school_grade_specialties, :code, unique: true
  end
end
