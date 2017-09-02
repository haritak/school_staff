class ChangeTableSchoolGradeSpecialtiesForDeprecationSupport < ActiveRecord::Migration[5.1]
  def change
    add_column :school_grade_specialties, :deprecated, :bool, default: false
    add_column :school_grade_specialties, :deprecated_reference, :string
  end
end
