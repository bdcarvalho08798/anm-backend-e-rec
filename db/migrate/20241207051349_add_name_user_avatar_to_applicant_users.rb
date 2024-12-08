class AddNameUserAvatarToApplicantUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :applicant_users, :name, :string
    add_column :applicant_users, :user_avatar, :string
  end
end
