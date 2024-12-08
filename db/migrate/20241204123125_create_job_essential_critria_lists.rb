class CreateJobEssentialCritriaLists < ActiveRecord::Migration[7.1]
  def change
    create_table :job_essential_critria_lists do |t|
      t.references :job_list, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
