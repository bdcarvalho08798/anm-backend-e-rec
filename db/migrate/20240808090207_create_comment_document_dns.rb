class CreateCommentDocumentDns < ActiveRecord::Migration[7.1]
  def change
    create_table :comment_document_dns do |t|
      t.string :comment
      t.references :user, null: false, foreign_key: true
      t.references :document_from_dn, null: false, foreign_key: true

      t.timestamps
    end
  end
end
