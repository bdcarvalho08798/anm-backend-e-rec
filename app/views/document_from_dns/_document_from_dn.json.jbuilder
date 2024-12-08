json.extract! document_from_dn, :id, :sender, :subject, :reference_number, :priority, :category, :status, :forwardstatus, :attachment_doc_dn, :directorate_id, :natdirectorate_id, :created_at, :updated_at
json.url document_from_dn_url(document_from_dn, format: :json)
