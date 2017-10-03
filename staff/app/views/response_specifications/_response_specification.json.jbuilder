json.extract! response_specification, :id, :request_specification_id, :template_filename, :created_at, :updated_at
json.url response_specification_url(response_specification, format: :json)
