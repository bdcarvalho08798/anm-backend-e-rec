class CreateMinisterDocumentDirectorates < ActiveRecord::Migration[7.1]
  def change
    create_table :minister_document_directorates do |t|
      t.references :directorate, null: false, foreign_key: true
      t.references :minister_document_forward_directorate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
