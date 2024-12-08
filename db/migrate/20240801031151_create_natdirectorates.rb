class CreateNatdirectorates < ActiveRecord::Migration[7.1]
  def change
    create_table :natdirectorates do |t|
      t.string :natdircode
      t.string :natdirname
      t.references :directorate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
