class ArchivesController < ApplicationController
  before_action :set_archive, only: %i[ show edit update destroy ]
  before_action :set_directorate_id, only: %i[index new show edit update destroy ]

  load_and_authorize_resource

  # GET /archives or /archives.json
  def index
    # @archives = Archive.all

    @q = Archive.where(directorate_id: @directorate_id).order(created_at: :desc).ransack(params[:q])
    @archives = @q.result(distinct: true).page(params[:page]).per(10)
  end

  # GET /archives/1 or /archives/1.json
  def show
  end

  # GET /archives/new
  def new
    @archive = Archive.new
  end

  # GET /archives/1/edit
  def edit
  end

  # POST /archives or /archives.json
  def create
    @archive = Archive.new(archive_params)
    @archive.user_id = current_user.id 


    respond_to do |format|
      if @archive.save
        format.html { redirect_to archive_url(@archive), notice: "Archive was successfully created." }
        format.json { render :show, status: :created, location: @archive }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archives/1 or /archives/1.json
  def update
    respond_to do |format|
      if @archive.update(archive_params)
        format.html { redirect_to archive_url(@archive), notice: "Archive was successfully updated." }
        format.json { render :show, status: :ok, location: @archive }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archives/1 or /archives/1.json
  def destroy
    @archive.destroy!

    respond_to do |format|
      format.html { redirect_to archives_url, notice: "Archive was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archive
      @archive = Archive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def archive_params
      params.require(:archive).permit(:title, :author, :reference_number, :prioroty, :category, :status, :directorate_id, :natdirectorate_id, :attachment_doc)
    end

    def set_directorate_id
      @directorate_id = current_user.directorate_id
      @natdirectorate_id = current_user.natdirectorate_id
      @directorate = Directorate.find_by(id: @directorate_id)
      @natdirectorate = Natdirectorate.find_by(id: @natdirectorate_id)
    end
end
