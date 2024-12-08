class Api::V1::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token # for API

    def create
      user = ApplicantUser.find_by(email: session_params[:email])
  
      if user && user.valid_password?(session_params[:password])
        token = user.generate_jwt
        render json: { message: 'Login successful', token: token, user: user }, status: :ok
      else
        render json: { errors: ['Invalid credentials'] }, status: :unauthorized
      end
    end
  
    private
  
    def session_params
      params.require(:applicant_user).permit(:email, :password)
    end
end
