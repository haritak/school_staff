class AvoidDuplicatesInSchoolClasses < ActiveRecord::Migration[5.1]
  def change
    add_index :school_classes,
      [:schoolyear_id, :school_id, :school_grade_specialty_id, :number],
      unique: true,
      name: "uniqeness in school_classes"
  end
end
