class CreateDocumentDgDepartmentUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :document_dg_department_units do |t|
      t.references :department, null: false, foreign_key: true
      t.references :document_dg_forward_department_unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
