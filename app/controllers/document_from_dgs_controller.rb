class DocumentFromDgsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document_from_dg, only: %i[ show edit update destroy ]
  before_action :set_directorate_id, only: %i[index show edit new update]
  before_action :set_userid, only: %i[index ]
  before_action :get_directorate, only: %i[index show ] 
  
  load_and_authorize_resource

  # GET /document_from_dgs or /document_from_dgs.json
  def index
    @q = DocumentFromDg.where(directorate_id: @directorate_id).order(created_at: :desc).ransack(params[:q])
    @document_from_dgs = @q.result(distinct: true).page(params[:page]).per(10)

   
    # @document_from_dgs = DocumentFromDg.where(directorate_id: @directorate_id)


  end

  # GET /document_from_dgs/1 or /document_from_dgs/1.json
  def show
    @comment_document_dg = @document_from_dg.comment_document_dgs.build
  end

  # GET /document_from_dgs/new
  def new
    @document_from_dg = DocumentFromDg.new
  end

  # GET /document_from_dgs/1/edit
  def edit
  end

  # POST /document_from_dgs or /document_from_dgs.json
  def create
    @document_from_dg = DocumentFromDg.new(document_from_dg_params)

    respond_to do |format|
      if @document_from_dg.save
        format.html { redirect_to document_from_dg_url(@document_from_dg), notice: "Document from dg was successfully created." }
        format.json { render :show, status: :created, location: @document_from_dg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document_from_dg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_from_dgs/1 or /document_from_dgs/1.json
  def update
    respond_to do |format|
      if @document_from_dg.update(document_from_dg_params)
        if current_user&.operator_dn?
          format.html { redirect_to view_doc_dg_path(@document_from_dg), notice: 'Document was successfully updated.'  }
        elsif current_user&.operator_minister?
          format.html { redirect_to view_document_from_dg_op_minister_path(@document_from_dg), notice: 'Document was successfully updated.'  }
        elsif current_user&.natdirectorate?
          format.html { redirect_to view_doc_dg_path(@document_from_dg), notice: 'Document was successfully updated.'  }
        elsif current_user&.department?
          format.html { redirect_to view_document_from_dg_path(@document_from_dg), notice: 'Document was successfully updated.'  }
        elsif current_user&.staff?
          format.html { redirect_to view_doc_dg_by_staff_path(@document_from_dg), notice: 'Document was successfully updated.'  }
        else
          format.html { redirect_to document_from_dg_url(@document_from_dg), notice: "Document from dg was successfully updated." }
          format.json { render :show, status: :ok, location: @document_from_dg }
        end 
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document_from_dg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_from_dgs/1 or /document_from_dgs/1.json
  def destroy
    @document_from_dg.destroy!

    respond_to do |format|
      format.html { redirect_to document_from_dgs_url, notice: "Document from dg was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_from_dg
      @document_from_dg = DocumentFromDg.find(params[:id])
      @natdirectorate_id = current_user.natdirectorate_id
      @document_dg_forward_natdirectorates = DocumentDgForwardNatdirectorate.find_by(document_from_dg_id: @document_from_dg )
      @document_dg_natdirectorates = DocumentDgNatdirectorate.where(document_dg_forward_natdirectorate_id: @document_dg_forward_natdirectorates )

      @document_dg_forward_department_unit = DocumentDgForwardDepartmentUnit.find_by(document_from_dg_id: @document_from_dg )
      @document_dg_department_units = DocumentDgDepartmentUnit.where(document_dg_forward_department_unit_id: @document_dg_forward_department_unit)
    end

    # Only allow a list of trusted parameters through.
    def document_from_dg_params
      params.require(:document_from_dg).permit(:sender, :subject, :reference_number, :document_source,
       :priority, :category, :status, :directorate_id, :forwardstatus, :attachment_doc_dg)
    end

    def set_directorate_id
      @directorate_id = current_user.directorate_id
      
    end

    def set_userid
      @user_id = current_user.id
      @app_userid = User.find_by(id: @user_id) 
    end 

    def get_directorate
      @directorate_id = current_user.directorate_id
      @directorates = Directorate.where(id: @directorate_id ,unit: true)
      
    end



end
