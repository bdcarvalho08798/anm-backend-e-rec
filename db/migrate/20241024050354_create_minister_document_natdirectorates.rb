class CreateMinisterDocumentNatdirectorates < ActiveRecord::Migration[7.1]
  def change
    create_table :minister_document_natdirectorates do |t|
      t.references :minister_document_forward_natdirectorate, null: false, foreign_key: true
      t.references :natdirectorate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
