class AddUserAvatarToUserProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :user_profiles, :user_avatar, :string
  end
end
