class CreateArchives < ActiveRecord::Migration[7.1]
  def change
    create_table :archives do |t|
      t.string :title
      t.string :author
      t.string :reference_number
      t.integer :prioroty
      t.integer :category
      t.integer :status
      t.references :directorate, null: false, foreign_key: true
      t.references :natdirectorate, null: false, foreign_key: true
      t.string :attachment_doc

      t.timestamps
    end
  end
end
