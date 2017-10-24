class CreateSchoolTeacherResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :school_teacher_responses do |t|
      t.belongs_to :school_teacher_request, foreign_key: true
      t.integer :decision_no
      t.integer :decision_year
      t.integer :protocol_no
      t.date :protocol_date
      t.integer :decision_duration
      t.date :decision_starting_date
      t.text :comments
      t.boolean :response_completed

      t.timestamps
    end
  end
end
