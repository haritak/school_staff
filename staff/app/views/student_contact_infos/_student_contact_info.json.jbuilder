json.extract! student_contact_info, :id, :student_id, :info, :type, :created_at, :updated_at
json.url student_contact_info_url(student_contact_info, format: :json)
