class CreateConstitutionalGovernments < ActiveRecord::Migration[7.1]
  def change
    create_table :constitutional_governments do |t|
      t.integer :sequential_number
      t.string :constitutional_government_name

      t.timestamps
    end
  end
end
