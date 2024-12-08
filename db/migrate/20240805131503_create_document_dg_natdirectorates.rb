class CreateDocumentDgNatdirectorates < ActiveRecord::Migration[7.1]
  def change
    create_table :document_dg_natdirectorates do |t|
      t.references :natdirectorate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
