class CreateDocumentFromDns < ActiveRecord::Migration[7.1]
  def change
    create_table :document_from_dns do |t|
      t.string :sender
      t.string :subject
      t.string :reference_number
      t.integer :priority
      t.integer :category
      t.integer :status
      t.integer :forwardstatus
      t.string :attachment_doc_dn
      t.references :directorate, null: false, foreign_key: true
      t.references :natdirectorate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
