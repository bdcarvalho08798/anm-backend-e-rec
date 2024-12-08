json.extract! archive, :id, :title, :author, :reference_number, :prioroty, :category, :status, :directorate_id, :natdirectorate_id, :attachment_doc, :created_at, :updated_at
json.url archive_url(archive, format: :json)
