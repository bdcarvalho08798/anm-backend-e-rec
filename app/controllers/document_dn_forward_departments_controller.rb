class DocumentDnForwardDepartmentsController < ApplicationController
  before_action :set_document_dn_forward_department, only: %i[ show edit update destroy ]
  before_action :set_doc_id, only: %i[ show new edit update  ]

  # GET /document_dn_forward_departments or /document_dn_forward_departments.json
  def index
    @document_dn_forward_departments = DocumentDnForwardDepartment.all
  end

  # GET /document_dn_forward_departments/1 or /document_dn_forward_departments/1.json
  def show
  end

  # GET /document_dn_forward_departments/new
  def new
    @document_dn_forward_department = DocumentDnForwardDepartment.new
  end

  # GET /document_dn_forward_departments/1/edit
  def edit
  end

  # POST /document_dn_forward_departments or /document_dn_forward_departments.json
  def create
    @document_dn_forward_department = DocumentDnForwardDepartment.new(document_dn_forward_department_params)

    respond_to do |format|
      if @document_dn_forward_department.save
        document_from_dn = DocumentFromDn.find_by(id: @document_dn_forward_department.document_from_dn_id)
        document_from_dn.update(forwardstatus: 'department')

        format.html { redirect_to document_from_dns_path, notice: "Document DN was successfully forwarded." }
        format.json { render :show, status: :created, location: @document_dn_forward_department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document_dn_forward_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_dn_forward_departments/1 or /document_dn_forward_departments/1.json
  def update
    respond_to do |format|
      if @document_dn_forward_department.update(document_dn_forward_department_params)
        format.html { redirect_to document_dn_forward_department_url(@document_dn_forward_department), notice: "Document dn forward department was successfully updated." }
        format.json { render :show, status: :ok, location: @document_dn_forward_department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document_dn_forward_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_dn_forward_departments/1 or /document_dn_forward_departments/1.json
  def destroy
    @document_dn_forward_department.destroy!

    respond_to do |format|
      format.html { redirect_to document_dn_forward_departments_url, notice: "Document dn forward department was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_dn_forward_department
      @document_dn_forward_department = DocumentDnForwardDepartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_dn_forward_department_params
      params.require(:document_dn_forward_department).permit(:description, :document_from_dn_id,
      document_dn_departments_attributes: [:id, :department_id, :_destroy ]
      )
    end

    def set_doc_id
      @doc_id= params[:doc_id]
      @dg_id = current_user.directorate_id
      @dn_id = current_user.natdirectorate_id
      @departments = Department.where(natdirectorate_id: @dn_id).order(:depname)
    end
end
