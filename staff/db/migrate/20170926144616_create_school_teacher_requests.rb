class CreateSchoolTeacherRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :school_teacher_requests do |t|
      t.belongs_to :school_teacher, foreign_key: true
      t.belongs_to :request_specification, foreign_key: true
      t.string :filename

      t.timestamps
    end
  end
end
