class CreateDocumentDgForwardDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :document_dg_forward_departments do |t|
      t.references :document_from_dg, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
