class CreateMinisterDocumentForwardDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :minister_document_forward_departments do |t|
      t.text :description
      t.references :minister_document, null: false, foreign_key: true
      t.references :natdirectorate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
