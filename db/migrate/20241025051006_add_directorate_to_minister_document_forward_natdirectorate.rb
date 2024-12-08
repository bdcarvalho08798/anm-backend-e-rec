class AddDirectorateToMinisterDocumentForwardNatdirectorate < ActiveRecord::Migration[7.1]
  def change
    add_reference :minister_document_forward_natdirectorates, :directorate, null: false, foreign_key: true, default: 1
  end
end
