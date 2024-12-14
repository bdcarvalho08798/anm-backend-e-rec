class JobApplication < ApplicationRecord
  belongs_to :job_list
  belongs_to :applicant_user
  mount_uploader :resume, ResumeUploader
  mount_uploader :diplomadegree, DiplomadegreeUploader
  mount_uploader :transcriptdegree, TranscriptdegreeUploader

  has_many :job_essential_criteria_responses
  accepts_nested_attributes_for :job_essential_criteria_responses, reject_if: :all_blank, allow_destroy: true
end
