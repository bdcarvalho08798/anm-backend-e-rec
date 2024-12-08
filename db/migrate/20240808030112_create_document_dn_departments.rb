class CreateDocumentDnDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :document_dn_departments do |t|
      t.references :document_dn_forward_department, null: false, foreign_key: true
      # t.references :document_from_dn, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
