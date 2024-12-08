class AddAttachmentDocDgToDocumentFromDg < ActiveRecord::Migration[7.1]
  def change
    add_column :document_from_dgs, :attachment_doc_dg, :string
  end
end
