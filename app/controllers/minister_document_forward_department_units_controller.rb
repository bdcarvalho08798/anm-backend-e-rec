class MinisterDocumentForwardDepartmentUnitsController < ApplicationController
  before_action :set_minister_document_forward_department_unit, only: %i[ show edit update destroy ]
  before_action :set_department_id, only: %i[new ]

  # GET /minister_document_forward_department_units or /minister_document_forward_department_units.json
  def index
    @minister_document_forward_department_units = MinisterDocumentForwardDepartmentUnit.all
  end

  # GET /minister_document_forward_department_units/1 or /minister_document_forward_department_units/1.json
  def show
  end

  # GET /minister_document_forward_department_units/new
  def new
    @minister_document_forward_department_unit = MinisterDocumentForwardDepartmentUnit.new
  end

  # GET /minister_document_forward_department_units/1/edit
  def edit
  end

  # POST /minister_document_forward_department_units or /minister_document_forward_department_units.json
  def create
    @minister_document_forward_department_unit = MinisterDocumentForwardDepartmentUnit.new(minister_document_forward_department_unit_params)

    respond_to do |format|
      if @minister_document_forward_department_unit.save

        if current_user&.operator_dg?
          format.html { redirect_to dashboard_operator_directorate_path, notice: "Minister document forward department was successfully sent." }
        end 
        # format.html { redirect_to minister_document_forward_department_unit_url(@minister_document_forward_department_unit), notice: "Minister document forward department unit was successfully created." }
        format.json { render :show, status: :created, location: @minister_document_forward_department_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minister_document_forward_department_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minister_document_forward_department_units/1 or /minister_document_forward_department_units/1.json
  def update
    respond_to do |format|
      if @minister_document_forward_department_unit.update(minister_document_forward_department_unit_params)
        format.html { redirect_to minister_document_forward_department_unit_url(@minister_document_forward_department_unit), notice: "Minister document forward department unit was successfully updated." }
        format.json { render :show, status: :ok, location: @minister_document_forward_department_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minister_document_forward_department_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minister_document_forward_department_units/1 or /minister_document_forward_department_units/1.json
  def destroy
    @minister_document_forward_department_unit.destroy!

    respond_to do |format|
      format.html { redirect_to minister_document_forward_department_units_url, notice: "Minister document forward department unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minister_document_forward_department_unit
      @minister_document_forward_department_unit = MinisterDocumentForwardDepartmentUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minister_document_forward_department_unit_params
      params.require(:minister_document_forward_department_unit).permit(:description, :minister_document_id, :directorate_id,
      minister_document_department_units_attributes: [:id, :department_id, :_destroy ])
    end

    def set_department_id
      @dg_id = current_user.directorate_id
      @departments = Department.where(directorate_id: @dg_id).order(:depname)
    end
end
