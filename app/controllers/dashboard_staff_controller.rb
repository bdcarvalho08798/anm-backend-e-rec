class DashboardStaffController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document_from_dg, only: %i[ view_doc_dg_by_staff view_doc_dn]
  before_action :set_directorate_id, only: %i[index view_doc_dg_by_staff doc_dn]
  before_action :set_userid, only: %i[index  view_doc_dg_by_staff view_doc_dn] 

  def index
    @q = DocumentFromDg
    .joins(:document_dg_forward_departments)
    .where(document_dg_forward_departments: { document_from_dg_id: DocumentFromDg.select(:id) })
    .distinct
    .order(created_at: :desc).ransack(params[:q])

    @document_from_dgs = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_doc_dg_by_staff
    @document_from_dg = DocumentFromDg.find(params[:id])
    @comment_document_dg = @document_from_dg.comment_document_dgs.build
  end

  def doc_dn
    # @q = DocumentFromDn.where(natdirectorate_id: @natdirectorate_id).ransack(params[:q])
    @q = DocumentFromDn
    .joins(:document_dn_forward_departments)
    .where(document_dn_forward_departments: { document_from_dn_id: DocumentFromDn.select(:id) })
    .distinct
    .order(created_at: :desc).ransack(params[:q])
    @document_from_dns =  @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_doc_dn
    @document_from_dn = DocumentFromDn.find(params[:id])
    @comment_document_dn = @document_from_dn.comment_document_dns.build
  end

  private
  def set_directorate_id
    @directorate_id = current_user.directorate_id
    @natdirectorate_id = current_user.natdirectorate_id
  end

  def set_document_from_dg
    @document_from_dg = DocumentFromDg.find(params[:id])
  end

  def set_userid
    @user_id = current_user.id
    @app_userid = User.find_by(id: @user_id) 
  end 
end
