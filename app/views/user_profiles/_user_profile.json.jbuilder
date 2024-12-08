json.extract! user_profile, :id, :user_id, :complete_name, :position, :user_avatar, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
json.user_avatar url_for(user_profile.user_avatar)
