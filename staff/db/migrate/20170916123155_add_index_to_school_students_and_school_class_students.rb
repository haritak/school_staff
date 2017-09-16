class AddIndexToSchoolStudentsAndSchoolClassStudents < ActiveRecord::Migration[5.1]
  def change
    add_index :school_students,
      [:student_id], unique: true, name: "uniqness_in_school_registrations"

    add_index :school_class_students, 
      [ :school_student_id, :school_class_id ],
      unique: true,
      name: "uniqness_in_school_class_registrations"
  end
end
