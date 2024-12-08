class MinisterDocumentForwardDepartmentsController < ApplicationController
  before_action :set_minister_document_forward_department, only: %i[ show edit update destroy ]
  before_action :set_department_id, only: %i[new ]

  # GET /minister_document_forward_departments or /minister_document_forward_departments.json
  def index
    @minister_document_forward_departments = MinisterDocumentForwardDepartment.all
  end

  # GET /minister_document_forward_departments/1 or /minister_document_forward_departments/1.json
  def show
  end

  # GET /minister_document_forward_departments/new
  def new
    @minister_document_forward_department = MinisterDocumentForwardDepartment.new
  end

  # GET /minister_document_forward_departments/1/edit
  def edit
  end

  # POST /minister_document_forward_departments or /minister_document_forward_departments.json
  def create
    @minister_document_forward_department = MinisterDocumentForwardDepartment.new(minister_document_forward_department_params)

    respond_to do |format|
      if @minister_document_forward_department.save
        minister_document = MinisterDocument.find_by(id: @minister_document_forward_department.minister_document_id)
        # minister_document.update(forward_status: 'department')

        if current_user&.operator_dn?
          format.html { redirect_to minister_document_op_dn_path, notice: "Minister document forward department was successfully created." }
        end 

        # format.html { redirect_to minister_document_forward_department_url(@minister_document_forward_department), notice: "Minister document forward department was successfully created." }
        format.json { render :show, status: :created, location: @minister_document_forward_department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minister_document_forward_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minister_document_forward_departments/1 or /minister_document_forward_departments/1.json
  def update
    respond_to do |format|
      if @minister_document_forward_department.update(minister_document_forward_department_params)
        format.html { redirect_to minister_document_forward_department_url(@minister_document_forward_department), notice: "Minister document forward department was successfully updated." }
        format.json { render :show, status: :ok, location: @minister_document_forward_department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minister_document_forward_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minister_document_forward_departments/1 or /minister_document_forward_departments/1.json
  def destroy
    @minister_document_forward_department.destroy!

    respond_to do |format|
      format.html { redirect_to minister_document_forward_departments_url, notice: "Minister document forward department was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minister_document_forward_department
      @minister_document_forward_department = MinisterDocumentForwardDepartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minister_document_forward_department_params
      params.require(:minister_document_forward_department).permit(:description, :minister_document_id, :natdirectorate_id, 
      minister_document_departments_attributes: [:id, :department_id, :_destroy ])
    end

    def set_department_id
      @natdir_id = current_user.natdirectorate_id
      @departments = Department.where(natdirectorate_id: @natdir_id).order(:depname)
    end
end
