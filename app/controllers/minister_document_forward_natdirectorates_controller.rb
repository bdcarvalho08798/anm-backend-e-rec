class MinisterDocumentForwardNatdirectoratesController < ApplicationController
  before_action :set_minister_document_forward_natdirectorate, only: %i[ show edit update destroy ]
  before_action :set_natdirectorate_id, only: %i[new ]

  # GET /minister_document_forward_natdirectorates or /minister_document_forward_natdirectorates.json
  def index
    @minister_document_forward_natdirectorates = MinisterDocumentForwardNatdirectorate.all
  end

  # GET /minister_document_forward_natdirectorates/1 or /minister_document_forward_natdirectorates/1.json
  def show
  end

  # GET /minister_document_forward_natdirectorates/new
  def new
    @minister_document_forward_natdirectorate = MinisterDocumentForwardNatdirectorate.new
  end

  # GET /minister_document_forward_natdirectorates/1/edit
  def edit
  end

  # POST /minister_document_forward_natdirectorates or /minister_document_forward_natdirectorates.json
  def create
    @minister_document_forward_natdirectorate = MinisterDocumentForwardNatdirectorate.new(minister_document_forward_natdirectorate_params)

    respond_to do |format|
      if @minister_document_forward_natdirectorate.save
        minister_document = MinisterDocument.find_by(id: @minister_document_forward_natdirectorate.minister_document_id)
        minister_document.update(forward_status: 'natdirectorate')

        if current_user&.operator_dg?
          format.html { redirect_to dashboard_operator_directorate_path, notice: "Minister document forward natdirectorate was successfully created." }
        end 

        # format.html { redirect_to minister_document_forward_natdirectorate_url(@minister_document_forward_natdirectorate), notice: "Minister document forward natdirectorate was successfully created." }
        format.json { render :show, status: :created, location: @minister_document_forward_natdirectorate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minister_document_forward_natdirectorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minister_document_forward_natdirectorates/1 or /minister_document_forward_natdirectorates/1.json
  def update
    respond_to do |format|
      if @minister_document_forward_natdirectorate.update(minister_document_forward_natdirectorate_params)
        format.html { redirect_to minister_document_forward_natdirectorate_url(@minister_document_forward_natdirectorate), notice: "Minister document forward natdirectorate was successfully updated." }
        format.json { render :show, status: :ok, location: @minister_document_forward_natdirectorate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minister_document_forward_natdirectorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minister_document_forward_natdirectorates/1 or /minister_document_forward_natdirectorates/1.json
  def destroy
    @minister_document_forward_natdirectorate.destroy!

    respond_to do |format|
      format.html { redirect_to minister_document_forward_natdirectorates_url, notice: "Minister document forward natdirectorate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minister_document_forward_natdirectorate
      @minister_document_forward_natdirectorate = MinisterDocumentForwardNatdirectorate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minister_document_forward_natdirectorate_params
      params.require(:minister_document_forward_natdirectorate).permit(:description, :minister_document_id, :directorate_id, 
      minister_document_natdirectorates_attributes: [:id, :natdirectorate_id, :_destroy ])
    end

    def set_natdirectorate_id
      @dg_id = current_user.directorate_id
      @natdirectorates = Natdirectorate.where(directorate_id: @dg_id).order(:natdirname)
    end
end
