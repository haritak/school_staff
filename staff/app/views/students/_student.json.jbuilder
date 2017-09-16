json.extract! student, :id, :last_name, :first_name, :father_name, :mother_name, :created_at, :updated_at
json.url student_url(student, format: :json)
