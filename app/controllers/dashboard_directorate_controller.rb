class DashboardDirectorateController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document_from_dg, only: %i[ show view_document_dg]
  before_action :set_document_from_dn, only: %i[view_document_dn]
  before_action :set_directorate_id, only: %i[index show document_dn view_document_dg minister_document_dg ]
  before_action :set_userid, only: %i[index view_document_dn view_document_dg]
  before_action :set_minister_document_id, only: %i[view_minister_document_dg ]

  # load_and_authorize_resource
  # before_action :authorize_page

  def index
    # @document_from_dgs = DocumentFromDg.where(directorate_id: @directorate_id)
    @q = DocumentFromDg.where(directorate_id: @directorate_id).ransack(params[:q])
    @document_from_dgsi = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @comment_document_dg = @document_from_dg.comment_document_dgs.build
  end

  def view_document_dg
    @comment_document_dg = @document_from_dg.comment_document_dgs.build
  end

  def document_dn
    @q = DocumentFromDn.where(directorate_id: @directorate_id).ransack(params[:q])
    @document_from_dns = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_document_dn
    @comment_document_dn = @document_from_dn.comment_document_dns.build
  end

  def minister_document_dg
    @q = MinisterDocument.joins(minister_document_forward_directorates: :minister_document_directorates)
         .where(minister_document_forward_directorates: {minister_document_id: MinisterDocument.select(:id)})
         .where(minister_document_directorates: {minister_document_forward_directorate_id: MinisterDocumentForwardDirectorate.select(:id)})
         .where(minister_document_directorates: {directorate_id: @directorate_id})
         .distinct
         .order(created_at: :desc)
         .ransack(params[:q])

    @minister_documents = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_minister_document_dg
    @comment_minister_document = @minister_document.comment_minister_documents.build
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_from_dg
      @document_from_dg = DocumentFromDg.find(params[:id])
      @document_from_dg_forward_natdirectorate = DocumentDgForwardNatdirectorate.find_by(document_from_dg_id: @document_from_dg )
      @document_from_dg_natdirectorates = DocumentDgNatdirectorate.where(document_dg_forward_natdirectorate_id: @document_from_dg_forward_natdirectorate )
      @document_dg_forward_department_unit = DocumentDgForwardDepartmentUnit.find_by(document_from_dg_id: @document_from_dg )
      @document_dg_department_units = DocumentDgDepartmentUnit.where(document_dg_forward_department_unit_id: @document_dg_forward_department_unit)
    end

    def set_document_from_dn
      @document_from_dn = DocumentFromDn.find(params[:id])
    end

    def set_directorate_id
      @directorate_id = current_user.directorate_id
      @directorates = Directorate.where(id: @directorate_id ,unit: true)
    end

    
    def set_minister_document_id
      @directorate_id = current_user.directorate_id
      @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.find_by(minister_document_id: params[:id])
      @minister_document = MinisterDocument.find_by(id: @minister_document_forward_directorate.minister_document_id)
      # @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.find_by(minister_document_id: @minister_document )
      @minister_document_forward_natdirectorates = MinisterDocumentForwardNatdirectorate.find_by(minister_document_id: @minister_document, directorate_id: @directorate_id )
      @minister_document_natdirectorates = MinisterDocumentNatdirectorate.where(minister_document_forward_natdirectorate_id: @minister_document_forward_natdirectorates)
      @minister_document_forward_department_units = MinisterDocumentForwardDepartmentUnit.find_by(minister_document_id: @minister_document, directorate_id: @directorate_id )
      @minister_document_department_units = MinisterDocumentDepartmentUnit.where(minister_document_forward_department_unit_id: @minister_document_forward_department_units)
    end

    def set_userid
      @user_id = current_user.id
      @app_userid = User.find_by(id: @user_id) 
    end 

    def authorize_page
      # Authorize the user for the current action on the :pages controller
      authorize! view_document_dg.to_sym, :DashboardDirectorate
    end
end
