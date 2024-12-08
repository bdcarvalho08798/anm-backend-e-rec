class AddDocumentDgForwardNatdirectorateToDocumentDgNatdirectorate < ActiveRecord::Migration[7.1]
  def change
    add_reference :document_dg_natdirectorates, :document_dg_forward_natdirectorate, null: false, foreign_key: true
  end
end
