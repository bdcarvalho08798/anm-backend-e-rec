class CreateCommentDocumentDgs < ActiveRecord::Migration[7.1]
  def change
    create_table :comment_document_dgs do |t|
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :document_from_dg, null: false, foreign_key: true

      t.timestamps
    end
  end
end
