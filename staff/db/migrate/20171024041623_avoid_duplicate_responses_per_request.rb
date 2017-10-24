class AvoidDuplicateResponsesPerRequest < ActiveRecord::Migration[5.1]
  def change
    add_index :school_teacher_responses, [:school_teacher_request_id], unique: true, name: "unique_one_response_per_request"
    add_index :school_teacher_responses, [:decision_no, :decision_year], unique: true
    add_index :school_teacher_responses, [:protocol_no, :protocol_date], unique: true
  end
end
