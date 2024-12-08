json.extract! document_from_dg, :id, :sender, :subject, :reference_number, :priority, :category, :status, :directorate_id, :forward_status, :created_at, :updated_at
json.url document_from_dg_url(document_from_dg, format: :json)
