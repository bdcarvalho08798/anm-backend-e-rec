class CreateMinisterDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :minister_documents do |t|
      t.string :sender
      t.string :subject
      t.string :reference_number
      t.string :document_source
      t.integer :priority
      t.integer :category
      t.integer :status
      t.integer :forward_status
      t.string :attachment_document

      t.timestamps
    end
  end
end
