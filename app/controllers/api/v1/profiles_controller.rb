class Api::V1::ProfilesController < ApplicationController
    protect_from_forgery with: :null_session

    # GET /api/v1/profile
    def show
        email = request.headers['X-User-Email']
        puts "Received email: #{email}"  # Add this line to log the email
    
        user = ApplicantUser.find_by(email: email)
    
        if user
          render json: {
            id: user.id,
            name: user.name,
            email: user.email,
            user_avatar: user.user_avatar
          }
        else
          render json: { error: "User not found" }, status: :not_found
        end
      end
  
    # PUT /api/v1/profile
    def update
        email = request.headers['X-User-Email']
        user = ApplicantUser.find_by(email: email)
    
        if user && user.update(profile_params)
          render json: { message: "Profile updated successfully!", profile: user }, status: :ok
        else
          render json: { errors: user&.errors.full_messages || ["User not found"] }, status: :unprocessable_entity
        end
      end
  
    private
  
    def profile_params
      params.require(:applicant_user).permit(:name, :email, :user_avatar)
    end
  end
  