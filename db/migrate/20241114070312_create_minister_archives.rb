class CreateMinisterArchives < ActiveRecord::Migration[7.1]
  def change
    create_table :minister_archives do |t|
      t.string :document_title
      t.string :document_number
      t.string :reference_number
      t.integer :document_type
      t.integer :author
      t.text :remarks
      t.references :constitutional_government, null: false, foreign_key: true

      t.timestamps
    end
  end
end
