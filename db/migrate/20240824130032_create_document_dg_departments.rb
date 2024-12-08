class CreateDocumentDgDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :document_dg_departments do |t|
      t.references :document_dg_forward_department, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
