json.extract! person, :id, :first_name, :last_name, :father_name, :mother_name, :notification_email, :notifcation_sms_phone, :created_at, :updated_at
json.url person_url(person, format: :json)
