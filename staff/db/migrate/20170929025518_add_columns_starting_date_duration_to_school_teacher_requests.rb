class AddColumnsStartingDateDurationToSchoolTeacherRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :school_teacher_requests, :starting_date, :date
    add_column :school_teacher_requests, :duration, :integer
  end
end
