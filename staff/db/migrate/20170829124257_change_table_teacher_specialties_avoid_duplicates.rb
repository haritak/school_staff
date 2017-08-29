class ChangeTableTeacherSpecialtiesAvoidDuplicates < ActiveRecord::Migration[5.1]
  def change
    add_index :teacher_specialties,
      [:teacher_id, :specialty_id],
      unique: true,
      name: "uniqness_in_teacher_specialties"
  end
end
