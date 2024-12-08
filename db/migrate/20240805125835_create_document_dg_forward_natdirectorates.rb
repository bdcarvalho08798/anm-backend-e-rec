class CreateDocumentDgForwardNatdirectorates < ActiveRecord::Migration[7.1]
  def change
    create_table :document_dg_forward_natdirectorates do |t|
      t.text :description
      t.references :document_from_dg, null: false, foreign_key: true

      t.timestamps
    end
  end
end
