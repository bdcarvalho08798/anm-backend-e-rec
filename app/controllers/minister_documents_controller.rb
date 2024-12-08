class MinisterDocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_minister_document, only: %i[ show edit update destroy ]
  before_action :set_goverment_constitutional, only: %i[ index create ]

  

  load_and_authorize_resource

  # GET /minister_documents or /minister_documents.json
  def index
    @q = MinisterDocument.where(constitutional_government_id: @constitutional_government_id).order(created_at: :desc).ransack(params[:q])
    @minister_documents = @q.result(distinct: true).page(params[:page]).per(10)
  end

  # GET /minister_documents/1 or /minister_documents/1.json
  def show
    @comment_minister_document = @minister_document.comment_minister_documents.build
  end

  # GET /minister_documents/new
  def new
    @minister_document = MinisterDocument.new
  end

  # GET /minister_documents/1/edit
  def edit
  end

  # POST /minister_documents or /minister_documents.json
  def create
    @minister_document = MinisterDocument.new(minister_document_params)
    @minister_document.created_by = current_user.id
    @minister_document.constitutional_government_id =@constitutional_government_id.id
  

    respond_to do |format|
      if @minister_document.save
        format.html { redirect_to minister_document_url(@minister_document), notice: "Minister document was successfully created." }
        format.json { render :show, status: :created, location: @minister_document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minister_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minister_documents/1 or /minister_documents/1.json
  def update
    respond_to do |format|
      if @minister_document.update(minister_document_params)
        if current_user&.operator_minister?
          format.html { redirect_to minister_document_url(@minister_document), notice: "Minister document was successfully updated." }
        elsif current_user&.operator_dg?
          format.html { redirect_to view_minister_doc_op_dg_path(@minister_document), notice: "Minister document was successfully updated." }
        end

        # format.json { render :show, status: :ok, location: @minister_document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minister_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minister_documents/1 or /minister_documents/1.json
  def destroy
    @minister_document.destroy!

    respond_to do |format|
      format.html { redirect_to minister_documents_url, notice: "Minister document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minister_document
      @minister_document = MinisterDocument.find(params[:id])
      @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.find_by(minister_document_id: @minister_document )
      @minister_document_directorates = MinisterDocumentDirectorate.where(minister_document_forward_directorate_id: @minister_document_forward_directorate)
    
    end

    # Only allow a list of trusted parameters through.
    def minister_document_params
      params.require(:minister_document).permit(:sender, :subject, :reference_number, :document_source, :priority, :category, :status,
       :forward_status, :attachment_document, :constitutional_government_id)
    end

    def set_goverment_constitutional
      @constitutional_government_id = ConstitutionalGovernment.find_by(active: true)
    end 

    
end
