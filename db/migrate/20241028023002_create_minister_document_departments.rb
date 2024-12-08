class CreateMinisterDocumentDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :minister_document_departments do |t|
      t.references :department, null: false, foreign_key: true
      t.references :minister_document_forward_department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
