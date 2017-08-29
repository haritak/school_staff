class AddColumnRequiredHoursToSchoolGradeSpecialties < ActiveRecord::Migration[5.1]
  def change
    add_column :school_grade_specialties, :required_hours, :integer
  end
end
