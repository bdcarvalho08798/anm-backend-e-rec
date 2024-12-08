class DocumentDgForwardNatdirectoratesController < ApplicationController
  before_action :set_document_dg_forward_natdirectorate, only: %i[ show edit update destroy ]
  before_action :set_doc_id, only: %i[create show edit new update]

  # GET /document_dg_forward_natdirectorates or /document_dg_forward_natdirectorates.json
  def index
    @document_dg_forward_natdirectorates = DocumentDgForwardNatdirectorate.all
  end

  # GET /document_dg_forward_natdirectorates/1 or /document_dg_forward_natdirectorates/1.json
  def show
  end

  # GET /document_dg_forward_natdirectorates/new
  def new
    @document_dg_forward_natdirectorate = DocumentDgForwardNatdirectorate.new
  end

  # GET /document_dg_forward_natdirectorates/1/edit
  def edit
  end

  # POST /document_dg_forward_natdirectorates or /document_dg_forward_natdirectorates.json
  def create
    @document_dg_forward_natdirectorate = DocumentDgForwardNatdirectorate.new(document_dg_forward_natdirectorate_params)

    respond_to do |format|
      if @document_dg_forward_natdirectorate.save
        document_from_dg = DocumentFromDg.find_by(id: @document_dg_forward_natdirectorate.document_from_dg_id)
        document_from_dg.update(forwardstatus: 'natdirectorate')
       
        format.html { redirect_to root_path notice: "Document dg forward to natdirectorate was successfully  created DOC_ID: #{@document_dg_forward_natdirectorate.document_from_dg_id}." }
        # format.json { render :show, status: :created, location: @document_dg_forward_natdirectorate }
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json { render json: @document_dg_forward_natdirectorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_dg_forward_natdirectorates/1 or /document_dg_forward_natdirectorates/1.json
  def update
    respond_to do |format|
      if @document_dg_forward_natdirectorate.update(document_dg_forward_natdirectorate_params)
        format.html { redirect_to document_dg_forward_natdirectorate_url(@document_dg_forward_natdirectorate), notice: "Document dg forward to natdirectorate was successfully updated." }
        format.json { render :show, status: :ok, location: @document_dg_forward_natdirectorate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document_dg_forward_natdirectorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_dg_forward_natdirectorates/1 or /document_dg_forward_natdirectorates/1.json
  def destroy
    @document_dg_forward_natdirectorate.destroy!

    respond_to do |format|
      format.html { redirect_to document_dg_forward_natdirectorates_url, notice: "Document dg forward to natdirectorate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_dg_forward_natdirectorate
      @document_dg_forward_natdirectorate = DocumentDgForwardNatdirectorate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_dg_forward_natdirectorate_params
      params.require(:document_dg_forward_natdirectorate).permit(:description, :document_from_dg_id, 
      document_dg_natdirectorates_attributes: [:id, :natdirectorate_id, :_destroy ]
      )
    end

    def set_doc_id
      @doc_id= params[:doc_id]
      @dg_id = current_user.directorate_id
      @natdirectorates = Natdirectorate.where(directorate_id: @dg_id).order(:natdirname)
    end
end
