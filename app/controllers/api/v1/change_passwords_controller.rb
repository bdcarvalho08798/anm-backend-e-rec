class Api::V1::ChangePasswordsController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def update
      user = ApplicantUser.find_by(email: change_password_params[:email])
  
      if user.nil?
        render json: { error: "User not found" }, status: :not_found and return
      end
  
      unless user.valid_password?(change_password_params[:old_password])
        render json: { error: "Old password is incorrect" }, status: :unprocessable_entity and return
      end
  
      if change_password_params[:new_password] != change_password_params[:password_confirmation]
        render json: { error: "Password confirmation does not match" }, status: :unprocessable_entity and return
      end
  
      if user.update(password: change_password_params[:new_password])
        render json: { message: "Password successfully updated" }, status: :ok
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def change_password_params
      params.require(:applicant_user).permit(:email, :old_password, :new_password, :password_confirmation)
    end
  end
  