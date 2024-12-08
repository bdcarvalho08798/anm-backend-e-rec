class DocumentFromDnsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document_from_dn, only: %i[ show edit update destroy ]
  before_action :set_directorate_id, only: %i[show edit new index update]

  load_and_authorize_resource

  # GET /document_from_dns or /document_from_dns.json
  def index
    @q = DocumentFromDn.where(natdirectorate_id: @natdirectorate_id).order(created_at: :desc).ransack(params[:q])
    @document_from_dns = @q.result(distinct: true).page(params[:page]).per(10)
  end

  # GET /document_from_dns/1 or /document_from_dns/1.json
  def show
    @comment_document_dn = @document_from_dn.comment_document_dns.build
  end

  # GET /document_from_dns/new
  def new
    @document_from_dn = DocumentFromDn.new
  end

  # GET /document_from_dns/1/edit
  def edit
  end

  # POST /document_from_dns or /document_from_dns.json
  def create
    @document_from_dn = DocumentFromDn.new(document_from_dn_params)

    respond_to do |format|
      if @document_from_dn.save
        format.html { redirect_to document_from_dn_url(@document_from_dn), notice: "Document from dn was successfully created." }
        format.json { render :show, status: :created, location: @document_from_dn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document_from_dn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_from_dns/1 or /document_from_dns/1.json
  def update
    respond_to do |format|
      if @document_from_dn.update(document_from_dn_params)
        if current_user&.operator_dn?
          format.html { redirect_to document_from_dn_url(@document_from_dn), notice: "Document from dn was successfully updated." }
          format.json { render :show, status: :ok, location: @document_from_dn } 
        elsif current_user&.department?
          format.html { redirect_to view_dcmt_from_dn_path(@document_from_dn), notice: 'Document was successfully updates.'  }
        elsif current_user&.staff?
          format.html { redirect_to view_doc_dn_path(@document_from_dn), notice: 'Document was successfully updates.'  }
        end
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document_from_dn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_from_dns/1 or /document_from_dns/1.json
  def destroy
    @document_from_dn.destroy!

    respond_to do |format|
      format.html { redirect_to document_from_dns_url, notice: "Document from dn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_from_dn
      @document_from_dn = DocumentFromDn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_from_dn_params
      params.require(:document_from_dn).permit(:sender, :subject, :reference_number, :priority, :category, :status,:document_source,
       :forwardstatus, :attachment_doc_dn, :directorate_id, :natdirectorate_id)
    end

    def set_directorate_id
      @directorate_id = current_user.directorate_id
      @natdirectorate_id = current_user.natdirectorate_id
    end
end
