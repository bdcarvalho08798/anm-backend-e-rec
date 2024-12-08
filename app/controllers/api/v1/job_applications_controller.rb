class Api::V1::JobApplicationsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
        @job_applications = JobApplication.all
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
      params.require(:job_application).permit(:job_list_id, :email, :resume, :diplomadegree, :transcriptdegree)
    end
end
