json.extract! request_support_document, :id, :school_teacher_request_id, :order, :issuer, :issuer_protocol, :issuer_date, :description, :created_at, :updated_at
json.url request_support_document_url(request_support_document, format: :json)
