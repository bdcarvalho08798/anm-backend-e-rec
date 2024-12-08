class CreateDocumentDnForwardDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :document_dn_forward_departments do |t|
      t.text :description
      
      t.timestamps
    end
  end
end
