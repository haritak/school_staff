json.extract! school_teacher_response, :id, :school_teacher_request_id, :decision_no, :decision_year, :protocol_no, :protocol_date, :decision_duration, :decision_starting_date, :comments, :response_completed, :created_at, :updated_at
json.url school_teacher_response_url(school_teacher_response, format: :json)
