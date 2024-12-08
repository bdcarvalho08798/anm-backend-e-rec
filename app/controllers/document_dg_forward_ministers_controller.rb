class DocumentDgForwardMinistersController < ApplicationController
  before_action :set_document_dg_forward_minister, only: %i[ show edit update destroy ]
  before_action :set_document_from_dg, only: %i[ new ]

  # GET /document_dg_forward_ministers or /document_dg_forward_ministers.json
  def index
    @document_dg_forward_ministers = DocumentDgForwardMinister.all
  end

  # GET /document_dg_forward_ministers/1 or /document_dg_forward_ministers/1.json
  def show
  end

  # GET /document_dg_forward_ministers/new
  def new
    @document_dg_forward_minister = DocumentDgForwardMinister.new
  end

  # GET /document_dg_forward_ministers/1/edit
  def edit
  end

  # POST /document_dg_forward_ministers or /document_dg_forward_ministers.json
  def create
    @document_dg_forward_minister = DocumentDgForwardMinister.new(document_dg_forward_minister_params)

    respond_to do |format|
      if @document_dg_forward_minister.save
        format.html { redirect_to root_path, notice: "Document dg sent to minister was successfully." }
        # format.json { render :show, status: :created, location: @document_dg_forward_minister }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document_dg_forward_minister.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_dg_forward_ministers/1 or /document_dg_forward_ministers/1.json
  def update
    respond_to do |format|
      if @document_dg_forward_minister.update(document_dg_forward_minister_params)
        format.html { redirect_to document_dg_forward_minister_url(@document_dg_forward_minister), notice: "Document dg forward minister was successfully updated." }
        format.json { render :show, status: :ok, location: @document_dg_forward_minister }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document_dg_forward_minister.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_dg_forward_ministers/1 or /document_dg_forward_ministers/1.json
  def destroy
    @document_dg_forward_minister.destroy!

    respond_to do |format|
      format.html { redirect_to document_dg_forward_ministers_url, notice: "Document dg forward minister was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_dg_forward_minister
      @document_dg_forward_minister = DocumentDgForwardMinister.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_dg_forward_minister_params
      params.require(:document_dg_forward_minister).permit(:description, :document_from_dg_id, :directorate_id)
    end

    def set_document_from_dg
      @doc_dg_id = params[:doc_id]
      @dg_id = current_user.directorate_id
    end 
end
