class Api::V1::JobListsController < ApplicationController
    def index
        # job_lists = JobList.all
        job_lists = JobList.includes(:job_essential_critria_lists)
        render json: job_lists.as_json(include: :job_essential_critria_lists)
      end

      def show
        # job_list = JobList.find(params[:id])
        # render json: job_list
        job_list = JobList.includes(:job_essential_critria_lists).find(params[:id])
        render json: job_list.as_json(include: :job_essential_critria_lists)
      end
end
