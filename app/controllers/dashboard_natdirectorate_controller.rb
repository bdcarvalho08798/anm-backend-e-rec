class DashboardNatdirectorateController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document_from_dg, only: %i[ show view_doc_dg]
  before_action :set_directorate_id, only: %i[index view_doc_dg doc_from_dn view_doc_from_dn minister_document_op_dn]
  before_action :set_userid, only: %i[index  view_doc_dg doc_from_dn view_doc_from_dn] 
  before_action :set_minister_document_id, only: %i[view_minister_document_op_dn ]

  def index
    @q = DocumentFromDg
      .joins(document_dg_forward_natdirectorates: :document_dg_natdirectorates)
      .where(document_dg_forward_natdirectorates: { document_from_dg_id: DocumentFromDg.select(:id) })
      .where(document_dg_natdirectorates: { document_dg_forward_natdirectorate_id: DocumentDgForwardNatdirectorate.select(:id) })
      .where(document_dg_natdirectorates: {natdirectorate_id: @natdirectorate_id})
      .distinct
      .order(created_at: :desc)
      .ransack(params[:q])

    @document_from_dgs = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def doc_from_dn 
    @q = DocumentFromDn.where(natdirectorate_id: @natdirectorate_id).ransack(params[:q])
    @document_from_dns =  @q.result(distinct: true).page(params[:page]).per(10)
  end

  def minister_document_op_dn
    @q = MinisterDocument.joins(minister_document_forward_natdirectorates: :minister_document_natdirectorates)
         .where(minister_document_forward_natdirectorates: {minister_document_id: MinisterDocument.select(:id)})
         .where(minister_document_natdirectorates: {minister_document_forward_natdirectorate_id: MinisterDocumentForwardNatdirectorate.select(:id)})
         .where(minister_document_natdirectorates: {natdirectorate_id: @natdirectorate_id})
         .distinct
         .order(created_at: :desc)
         .ransack(params[:q])

    @minister_documents = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_minister_document_op_dn
    @comment_minister_document = @minister_document.comment_minister_documents.build
  end 

  def view_doc_from_dn 
    @document_from_dn = DocumentFromDn.find(params[:id])
    @comment_document_dn = @document_from_dn.comment_document_dns.build

    @document_dn_forward_department = DocumentDnForwardDepartment.find_by(document_from_dn_id: @document_from_dn)
    @document_dn_departments = DocumentDnDepartment.where(document_dn_forward_department_id: @document_dn_forward_department)

  end

  def show
  end

  def view_doc_dg
    @comment_document_dg = @document_from_dg.comment_document_dgs.build
  end

  private
  def set_directorate_id
    @directorate_id = current_user.directorate_id
    @natdirectorate_id = current_user.natdirectorate_id
    @natdirectorate = Natdirectorate.find_by(id: @natdirectorate_id)
  end

  def set_document_from_dg
    @document_from_dg = DocumentFromDg.find(params[:id])
    @document_from_dg_forward_natdirectorate = DocumentDgForwardNatdirectorate.find_by(document_from_dg_id: @document_from_dg )
    @document_from_dg_natdirectorates = DocumentDgNatdirectorate.where(document_dg_forward_natdirectorate_id: @document_from_dg_forward_natdirectorate )
    @document_dg_forward_department = DocumentDgForwardDepartment.find_by(document_from_dg_id: @document_from_dg)
    @document_dg_departments = DocumentDgDepartment.where(document_dg_forward_department_id: @document_dg_forward_department)
  end

  def set_minister_document_id
    @minister_document_forward_natdirectorate = MinisterDocumentForwardNatdirectorate.find_by(minister_document_id: params[:id])
    @minister_document = MinisterDocument.find_by(id: @minister_document_forward_natdirectorate.minister_document_id)
    @directorate_id = current_user.directorate_id
    @natdirectorate_id = current_user.natdirectorate_id
    @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.find_by(minister_document_id: @minister_document )
    @minister_document_forward_natdirectorates = MinisterDocumentForwardNatdirectorate.find_by(minister_document_id: @minister_document, directorate_id: @directorate_id )
    @minister_document_forward_departments = MinisterDocumentForwardDepartment.find_by(minister_document_id: @minister_document, natdirectorate_id: @natdirectorate_id )
    @minister_document_departments = MinisterDocumentDepartment.where(minister_document_forward_department_id: @minister_document_forward_departments)
  end

  def set_userid
    @user_id = current_user.id
    @app_userid = User.find_by(id: @user_id) 
   @natdirectorate = Natdirectorate.find_by(id:  @app_userid.natdirectorate_id)

  end 
end
