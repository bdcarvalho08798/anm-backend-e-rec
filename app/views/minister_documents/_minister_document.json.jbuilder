json.extract! minister_document, :id, :sender, :subject, :reference_number, :document_source, :priority, :category, :status, :forward_status, :attachment_document, :created_at, :updated_at
json.url minister_document_url(minister_document, format: :json)
