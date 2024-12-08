class AddDocumentFromDnToDocumentDnForwardDepartment < ActiveRecord::Migration[7.1]
  def change
    add_reference :document_dn_forward_departments, :document_from_dn, null: false, foreign_key: true
  end
end
