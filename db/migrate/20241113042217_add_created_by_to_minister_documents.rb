class AddCreatedByToMinisterDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :minister_documents, :created_by, :integer
  end
end
