class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications do |t|
      t.references :job_list, null: false, foreign_key: true
      t.string :email
      t.string :resume
      t.string :diplomadegree
      t.string :transcriptdegree

      t.timestamps
    end
  end
end
