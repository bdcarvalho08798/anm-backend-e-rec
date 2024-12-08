class AddNameUserAvatarToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :user_avatar, :string
  end
end
