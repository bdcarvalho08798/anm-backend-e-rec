class ApplicantUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :user_avatar, UserAvatarUploader

  has_many :job_applications

  # devise :omniauthable, omniauth_providers: [:google_oauth2]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end

  def valid_token?(token)
    # Decode the token and match the user (use your token logic here)
    decoded_token = JWT.decode(token, Rails.application.secret_key_base).first
    decoded_token['sub'] == id
  rescue JWT::DecodeError
    false
  end
  
end
