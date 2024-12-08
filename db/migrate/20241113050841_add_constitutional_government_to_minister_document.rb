class AddConstitutionalGovernmentToMinisterDocument < ActiveRecord::Migration[7.1]
  def change
    add_reference :minister_documents, :constitutional_government, null: false, foreign_key: true, default: 1
  end
end
