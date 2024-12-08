class DashboardDepartmentController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document_from_dg, only: %i[ view_document_from_dg]
  before_action :set_directorate_id, only: %i[index view_document_from_dg dcmt_from_dn minister_document_dep]
  before_action :set_userid, only: %i[index  view_document_from_dg] 
  before_action :set_minister_document_id, only: %i[view_minister_document_dep ]


  def index
    if @unit_directorate.present?
      @q = DocumentFromDg
      .joins(document_dg_forward_department_units: :document_dg_department_units)
      .where(document_dg_forward_department_units: { document_from_dg_id: DocumentFromDg.select(:id) })
      .where(document_dg_department_units: { document_dg_forward_department_unit_id: DocumentDgForwardDepartmentUnit.select(:id) })
      .where(document_dg_department_units: { department_id: @department_id })
      .distinct
      .order(created_at: :desc)
      .ransack(params[:q])
    else
      @q = DocumentFromDg
      .joins(document_dg_forward_departments: :document_dg_departments)
      .where(document_dg_forward_departments: { document_from_dg_id: DocumentFromDg.select(:id) })
      .where(document_dg_departments: { document_dg_forward_department_id: DocumentDgForwardDepartment.select(:id) })
      .where(document_dg_departments: { department_id: @department_id })
      .distinct
      .order(created_at: :desc)
      .ransack(params[:q])
    end

    @document_from_dgs = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_document_from_dg
    @document_from_dg = DocumentFromDg.find(params[:id])
    @comment_document_dg = @document_from_dg.comment_document_dgs.build
  end

  def minister_document_dep
    if @unit_directorate.present?
      @q = MinisterDocument.joins(minister_document_forward_department_units: :minister_document_department_units)
         .where(minister_document_forward_department_units: {minister_document_id: MinisterDocument.select(:id)})
         .where(minister_document_department_units: {minister_document_forward_department_unit_id: MinisterDocumentForwardDepartmentUnit.select(:id)})
         .where(minister_document_department_units: {department_id: @department_id})
         .distinct
         .order(created_at: :desc)
         .ransack(params[:q])
    else
        @q = MinisterDocument.joins(minister_document_forward_departments: :minister_document_departments)
         .where(minister_document_forward_departments: {minister_document_id: MinisterDocument.select(:id)})
         .where(minister_document_departments: {minister_document_forward_department_id: MinisterDocumentForwardDepartment.select(:id)})
         .where(minister_document_departments: {department_id: @department_id})
         .distinct
         .order(created_at: :desc)
         .ransack(params[:q])
    end 

    @minister_documents = @q.result(distinct: true).page(params[:page]).per(10)
  end 

  def view_minister_document_dep
    @comment_minister_document = @minister_document.comment_minister_documents.build
  end 

  def dcmt_from_dn
    # @q = DocumentFromDn.where(natdirectorate_id: @natdirectorate_id).ransack(params[:q])
    @q = DocumentFromDn
    .joins(:document_dn_forward_departments)
    .where(document_dn_forward_departments: { document_from_dn_id: DocumentFromDn.select(:id) })
    .distinct
    .order(created_at: :desc).ransack(params[:q])
    @document_from_dns =  @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_dcmt_from_dn
    @document_from_dn = DocumentFromDn.find(params[:id])
    @comment_document_dn = @document_from_dn.comment_document_dns.build
  end

  private
  def set_directorate_id
    @directorate_id = current_user.directorate_id
    @natdirectorate_id = current_user.natdirectorate_id
    @department_id = current_user.department_id
    @unit_directorate = Directorate.where(id: @directorate_id ,unit: true)
  end

  def set_document_from_dg
    @document_from_dg = DocumentFromDg.find(params[:id])
  end

  def set_minister_document_id
    @directorate_id = current_user.directorate_id
    @natdirectorate_id = current_user.natdirectorate_id
    @department_id = current_user.department_id

    @unit_directorate = Directorate.where(id: @directorate_id ,unit: true)

    if @unit_directorate.present?
      @minister_document_forward_department = MinisterDocumentForwardDepartmentUnit.find_by(minister_document_id: params[:id])
    else
      @minister_document_forward_department = MinisterDocumentForwardDepartment.find_by(minister_document_id: params[:id])
    end
    
    @minister_document = MinisterDocument.find_by(id: @minister_document_forward_department.minister_document_id)
    
    @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.find_by(minister_document_id: @minister_document )
    @minister_document_forward_natdirectorates = MinisterDocumentForwardNatdirectorate.find_by(minister_document_id: @minister_document, directorate_id: @directorate_id )
    @minister_document_forward_department_units = MinisterDocumentForwardDepartmentUnit.find_by(minister_document_id: @minister_document, directorate_id: @directorate_id )
    @minister_document_forward_departments = MinisterDocumentForwardDepartment.find_by(minister_document_id: @minister_document, natdirectorate_id: @natdirectorate_id )
    @minister_document_departments = MinisterDocumentDepartment.where(minister_document_forward_department_id: @minister_document_forward_departments)
  end

  def set_userid
    @user_id = current_user.id
    @app_userid = User.find_by(id: @user_id) 
  end 
end
