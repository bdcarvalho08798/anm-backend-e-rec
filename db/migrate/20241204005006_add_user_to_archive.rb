class AddUserToArchive < ActiveRecord::Migration[7.1]
  def change
    add_reference :archives, :user, null: false, foreign_key: true, default: 1
  end
end
