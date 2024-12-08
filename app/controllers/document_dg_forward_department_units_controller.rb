class DocumentDgForwardDepartmentUnitsController < ApplicationController
  before_action :set_document_dg_forward_department_unit, only: %i[ show edit update destroy ]
  before_action :set_doc_id, only: %i[create show edit new update]

  # GET /document_dg_forward_department_units or /document_dg_forward_department_units.json
  def index
    @document_dg_forward_department_units = DocumentDgForwardDepartmentUnit.all
  end

  # GET /document_dg_forward_department_units/1 or /document_dg_forward_department_units/1.json
  def show
  end

  # GET /document_dg_forward_department_units/new
  def new
    @document_dg_forward_department_unit = DocumentDgForwardDepartmentUnit.new
  end

  # GET /document_dg_forward_department_units/1/edit
  def edit
  end

  # POST /document_dg_forward_department_units or /document_dg_forward_department_units.json
  def create
    @document_dg_forward_department_unit = DocumentDgForwardDepartmentUnit.new(document_dg_forward_department_unit_params)

    respond_to do |format|
      if @document_dg_forward_department_unit.save
        document_from_dg = DocumentFromDg.find_by(id: @document_dg_forward_department_unit.document_from_dg_id)
        document_from_dg.update(forwardstatus: 'department')
        # format.html { redirect_to document_dg_forward_department_unit_url(@document_dg_forward_department_unit), notice: "Document dg forward department unit was successfully created." }
        format.html { redirect_to root_path, notice: "Document DG was successfully forwarded." }
        format.json { render :show, status: :created, location: @document_dg_forward_department_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document_dg_forward_department_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_dg_forward_department_units/1 or /document_dg_forward_department_units/1.json
  def update
    respond_to do |format|
      if @document_dg_forward_department_unit.update(document_dg_forward_department_unit_params)
        format.html { redirect_to document_dg_forward_department_unit_url(@document_dg_forward_department_unit), notice: "Document dg forward department unit was successfully updated." }
        format.json { render :show, status: :ok, location: @document_dg_forward_department_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document_dg_forward_department_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_dg_forward_department_units/1 or /document_dg_forward_department_units/1.json
  def destroy
    @document_dg_forward_department_unit.destroy!

    respond_to do |format|
      format.html { redirect_to document_dg_forward_department_units_url, notice: "Document dg forward department unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_dg_forward_department_unit
      @document_dg_forward_department_unit = DocumentDgForwardDepartmentUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_dg_forward_department_unit_params
      params.require(:document_dg_forward_department_unit).permit(:document_from_dg_id, :description, 
      document_dg_department_units_attributes: [:id, :department_id, :_destroy ]
      )
    end

    def set_doc_id
      @doc_id= params[:doc_id]
      @dg_id = current_user.directorate_id
      @departments = Department.where(directorate_id: @dg_id).order(:depname)
    end
end
