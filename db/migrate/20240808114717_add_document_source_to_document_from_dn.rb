class AddDocumentSourceToDocumentFromDn < ActiveRecord::Migration[7.1]
  def change
    add_column :document_from_dns, :document_source, :integer
  end
end
