class CreateDocumentFromDgs < ActiveRecord::Migration[7.1]
  def change
    create_table :document_from_dgs do |t|
      t.string :sender
      t.string :subject
      t.string :reference_number
      t.integer :priority
      t.integer :category
      t.integer :status
      t.references :directorate, null: false, foreign_key: true
      t.integer :forwardstatus

      t.timestamps
    end
  end
end
