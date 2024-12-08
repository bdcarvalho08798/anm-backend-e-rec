json.extract! job_application, :id, :job_list_id, :email, :resume, :diplomadegree, :transcriptdegree, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
