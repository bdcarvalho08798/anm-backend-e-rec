class DocumentDgForwardDepartmentsController < ApplicationController
  before_action :set_document_dg_forward_department, only: %i[ show edit update destroy ]
  before_action :set_doc_id, only: %i[create show edit new update]

  # GET /document_dg_forward_departments or /document_dg_forward_departments.json
  def index
    @document_dg_forward_departments = DocumentDgForwardDepartment.all
  end

  # GET /document_dg_forward_departments/1 or /document_dg_forward_departments/1.json
  def show
  end

  # GET /document_dg_forward_departments/new
  def new
    @document_dg_forward_department = DocumentDgForwardDepartment.new
  end

  # GET /document_dg_forward_departments/1/edit
  def edit
  end

  # POST /document_dg_forward_departments or /document_dg_forward_departments.json
  def create
    @document_dg_forward_department = DocumentDgForwardDepartment.new(document_dg_forward_department_params)

    respond_to do |format|
      if @document_dg_forward_department.save
        document_from_dg = DocumentFromDg.find_by(id: @document_dg_forward_department.document_from_dg_id)
        document_from_dg.update(forwardstatus: 'department')

        format.html { redirect_to dashboard_natdirectorate_path, notice: "Document DG was successfully forwarded." }
        format.json { render :show, status: :created, location: @document_dg_forward_department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document_dg_forward_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_dg_forward_departments/1 or /document_dg_forward_departments/1.json
  def update
    respond_to do |format|
      if @document_dg_forward_department.update(document_dg_forward_department_params)
        format.html { redirect_to document_dg_forward_department_url(@document_dg_forward_department), notice: "Document dg forward department was successfully updated." }
        format.json { render :show, status: :ok, location: @document_dg_forward_department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document_dg_forward_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_dg_forward_departments/1 or /document_dg_forward_departments/1.json
  def destroy
    @document_dg_forward_department.destroy!

    respond_to do |format|
      format.html { redirect_to document_dg_forward_departments_url, notice: "Document dg forward department was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_dg_forward_department
      @document_dg_forward_department = DocumentDgForwardDepartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_dg_forward_department_params
      params.require(:document_dg_forward_department).permit(:document_from_dg_id, :description,
      document_dg_departments_attributes: [:id, :department_id, :_destroy ]
      )
    end

    def set_doc_id
      @doc_id= params[:doc_id]
      @dn_id = current_user.natdirectorate_id
      @departments = Department.where(natdirectorate_id: @dn_id).order(:depname)
    end
end
