json.extract! request_specification, :id, :request_type, :request_description, :request_spec_reference, :teacher_working_class_id, :template_filename, :created_at, :updated_at
json.url request_specification_url(request_specification, format: :json)
