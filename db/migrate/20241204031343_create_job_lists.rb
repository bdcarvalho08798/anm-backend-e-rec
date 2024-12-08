class CreateJobLists < ActiveRecord::Migration[7.1]
  def change
    create_table :job_lists do |t|
      t.string :title
      t.string :deadline
      t.text :description

      t.timestamps
    end
  end
end
