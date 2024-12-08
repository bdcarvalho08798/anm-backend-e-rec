class CreateCommentMinisterDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :comment_minister_documents do |t|
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :minister_document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
