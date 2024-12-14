class AddApplicantUserToJobApplications < ActiveRecord::Migration[7.1]
  def change
    add_reference :job_applications, :applicant_user, null: false, foreign_key: true, default: 1
  end
end
