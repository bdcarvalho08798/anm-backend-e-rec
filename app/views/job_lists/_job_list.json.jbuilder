json.extract! job_list, :id, :title, :deadline, :description, :created_at, :updated_at
json.url job_list_url(job_list, format: :json)
