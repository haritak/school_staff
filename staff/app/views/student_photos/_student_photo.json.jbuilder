json.extract! student_photo, :id, :student_id, :filename, :type, :created_at, :updated_at
json.url student_photo_url(student_photo, format: :json)
