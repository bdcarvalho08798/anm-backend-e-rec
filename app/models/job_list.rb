class JobList < ApplicationRecord
    has_rich_text :description
    has_many :job_applications
    has_many :job_essential_critria_lists
    accepts_nested_attributes_for :job_essential_critria_lists, reject_if: :all_blank, allow_destroy: true
end
