class MinisterArchivesController < ApplicationController
  before_action :set_minister_archive, only: %i[ show edit update destroy ]
  before_action :set_goverment_constitutional, only: %i[ create index ]

  load_and_authorize_resource

  # GET /minister_archives or /minister_archives.json
  def index
    @q = MinisterArchive.where(constitutional_government_id: @constitutional_government_id.id).ransack(params[:q])
    @minister_archives = @q.result(distinct: true).page(params[:page]).per(10)
  end

  # GET /minister_archives/1 or /minister_archives/1.json
  def show
  end

  # GET /minister_archives/new
  def new
    @minister_archive = MinisterArchive.new
  end

  # GET /minister_archives/1/edit
  def edit
  end

  # POST /minister_archives or /minister_archives.json
  def create
    @minister_archive = MinisterArchive.new(minister_archive_params)
    @minister_archive.constitutional_government_id =@constitutional_government_id.id

    respond_to do |format|
      if @minister_archive.save
        format.html { redirect_to minister_archive_url(@minister_archive), notice: "Minister archive was successfully created." }
        format.json { render :show, status: :created, location: @minister_archive }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minister_archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minister_archives/1 or /minister_archives/1.json
  def update
    respond_to do |format|
      if @minister_archive.update(minister_archive_params)
        format.html { redirect_to minister_archive_url(@minister_archive), notice: "Minister archive was successfully updated." }
        format.json { render :show, status: :ok, location: @minister_archive }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minister_archive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minister_archives/1 or /minister_archives/1.json
  def destroy
    @minister_archive.destroy!

    respond_to do |format|
      format.html { redirect_to minister_archives_url, notice: "Minister archive was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minister_archive
      @minister_archive = MinisterArchive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minister_archive_params
      params.require(:minister_archive).permit(:document_title, :document_number, :reference_number,
      :minister_archive_attachment, :document_type, :author, :remarks, :constitutional_government_id)
    end

    def set_goverment_constitutional
      @constitutional_government_id = ConstitutionalGovernment.find_by(active: true)
    end 
end
