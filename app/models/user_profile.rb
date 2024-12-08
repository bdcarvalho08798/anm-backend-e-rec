class UserProfile < ApplicationRecord
  belongs_to :user
  # has_one_attached :user_avatar
  has_many :minister_documents

  mount_uploader :user_avatar, UserAvatarUploader

  
end
