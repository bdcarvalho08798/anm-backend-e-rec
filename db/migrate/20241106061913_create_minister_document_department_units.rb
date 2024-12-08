class CreateMinisterDocumentDepartmentUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :minister_document_department_units do |t|
      t.references :minister_document_forward_department_unit, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
