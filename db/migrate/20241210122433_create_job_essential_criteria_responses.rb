class CreateJobEssentialCriteriaResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :job_essential_criteria_responses do |t|
      t.references :job_application, null: false, foreign_key: true
      t.string :response

      t.timestamps
    end
  end
end
