class AddColumnSchoolYearToSchoolStudent < ActiveRecord::Migration[5.1]
  def change
    add_reference :school_students, :schoolyear, foreign_key: true
  end
end
