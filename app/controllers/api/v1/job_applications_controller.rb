class Api::V1::JobApplicationsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
      userid = request.headers['X-User-userid']
      puts "Received userid: #{userid}"  # Add this line to log the email
    
      userid = ApplicantUser.find_by(id: userid)

      @job_applications = JobApplication.joins(:job_list)
          .select('job_applications.*, 
            job_lists.title AS job_title, 
            job_lists.deadline AS deadline')
          .where(applicant_user_id: userid)

        render json: @job_applications
    end

    def show
        @job_applications = JobApplication.find(params[:id])
        render json: @JobApplication
    end

    def new
        @job_application = JobApplication.new
    end

    def create
        job_application = JobApplication.new(job_application_params)
        if job_application.save
          render json: { message: 'Job application created successfully' }, status: :created
        else
          render json: { errors: job_application.errors.full_messages }, status: :unprocessable_entity
        end
    end
    

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_application_params
      params.require(:job_application).permit(:job_list_id, :email, :resume, :diplomadegree, :transcriptdegree, :applicant_user_id,
      job_essential_criteria_responses_attributes: [:id, :response, :_destroy ] )
    end
end
