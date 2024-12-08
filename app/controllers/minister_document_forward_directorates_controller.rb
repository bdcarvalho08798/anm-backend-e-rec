class MinisterDocumentForwardDirectoratesController < ApplicationController
  before_action :set_minister_document_forward_directorate, only: %i[ show edit update destroy ]

  # GET /minister_document_forward_directorates or /minister_document_forward_directorates.json
  def index
    @minister_document_forward_directorates = MinisterDocumentForwardDirectorate.all
  end

  # GET /minister_document_forward_directorates/1 or /minister_document_forward_directorates/1.json
  def show
  end

  # GET /minister_document_forward_directorates/new
  def new
    @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.new
  end

  # GET /minister_document_forward_directorates/1/edit
  def edit
  end

  # POST /minister_document_forward_directorates or /minister_document_forward_directorates.json
  def create
    @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.new(minister_document_forward_directorate_params)

    respond_to do |format|
      if @minister_document_forward_directorate.save
        minister_document = MinisterDocument.find_by(id: @minister_document_forward_directorate.minister_document_id)
        minister_document.update(forward_status: 'directorate')

        format.html { redirect_to minister_documents_path(minister_document), notice: "Minister document forward directorate was successfully created." }
        format.json { render :show, status: :created, location: @minister_document_forward_directorate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minister_document_forward_directorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minister_document_forward_directorates/1 or /minister_document_forward_directorates/1.json
  def update
    respond_to do |format|
      if @minister_document_forward_directorate.update(minister_document_forward_directorate_params)
        format.html { redirect_to minister_document_forward_directorate_url(@minister_document_forward_directorate), notice: "Minister document forward directorate was successfully updated." }
        format.json { render :show, status: :ok, location: @minister_document_forward_directorate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minister_document_forward_directorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minister_document_forward_directorates/1 or /minister_document_forward_directorates/1.json
  def destroy
    @minister_document_forward_directorate.destroy!

    respond_to do |format|
      format.html { redirect_to minister_document_forward_directorates_url, notice: "Minister document forward directorate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minister_document_forward_directorate
      @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minister_document_forward_directorate_params
      params.require(:minister_document_forward_directorate).permit(:description, :minister_document_id, 
      minister_document_directorates_attributes: [:id, :directorate_id, :_destroy ])
    end
end
