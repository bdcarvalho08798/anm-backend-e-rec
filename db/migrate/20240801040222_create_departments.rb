class CreateDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :departments do |t|
      t.string :depcode
      t.string :depname
      t.references :natdirectorate, null: false, foreign_key: true
      t.references :directorate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
