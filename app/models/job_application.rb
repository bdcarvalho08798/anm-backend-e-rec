class JobApplication < ApplicationRecord
  belongs_to :job_list
  mount_uploader :resume, ResumeUploader
  mount_uploader :diplomadegree, DiplomadegreeUploader
  mount_uploader :transcriptdegree, TranscriptdegreeUploader
end
