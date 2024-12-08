class JobListsController < ApplicationController
  before_action :set_job_list, only: %i[ show edit update destroy ]

  # GET /job_lists or /job_lists.json
  def index
    @job_lists = JobList.all
  end

  # GET /job_lists/1 or /job_lists/1.json
  def show
  end

  # GET /job_lists/new
  def new
    @job_list = JobList.new
  end

  # GET /job_lists/1/edit
  def edit
  end

  # POST /job_lists or /job_lists.json
  def create
    @job_list = JobList.new(job_list_params)

    respond_to do |format|
      if @job_list.save
        format.html { redirect_to @job_list, notice: "Job list was successfully created." }
        format.json { render :show, status: :created, location: @job_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_lists/1 or /job_lists/1.json
  def update
    respond_to do |format|
      if @job_list.update(job_list_params)
        format.html { redirect_to @job_list, notice: "Job list was successfully updated." }
        format.json { render :show, status: :ok, location: @job_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_lists/1 or /job_lists/1.json
  def destroy
    @job_list.destroy!

    respond_to do |format|
      format.html { redirect_to job_lists_path, status: :see_other, notice: "Job list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_list
      @job_list = JobList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_list_params
      params.require(:job_list).permit(:title, :deadline, :description,
      job_essential_critria_lists_attributes: [:id, :name, :_destroy ] )
    end
end
