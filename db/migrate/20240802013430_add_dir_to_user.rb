class AddDirToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :directorate, null: false, foreign_key: true, default: 1
    add_column :users, :username, :string
    add_column :users, :complete_name, :string
  end
end
