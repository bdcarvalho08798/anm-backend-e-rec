class AddDocumentSourceToDocumentFromDg < ActiveRecord::Migration[7.1]
  def change
    add_column :document_from_dgs, :document_source, :integer
  end
end
