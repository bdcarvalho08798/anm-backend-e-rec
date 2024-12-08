class DashboardOperatorDirectorateController < ApplicationController
  before_action :set_directorate_id, only: %i[index ]
  before_action :set_minister_document_id, only: %i[ view_minister_doc_op_dg]
  def index

    @q = MinisterDocument.joins(minister_document_forward_directorates: :minister_document_directorates)
         .where(minister_document_forward_directorates: {minister_document_id: MinisterDocument.select(:id)})
         .where(minister_document_directorates: {minister_document_forward_directorate_id: MinisterDocumentForwardDirectorate.select(:id)})
         .where(minister_document_directorates: {directorate_id: @directorate_id})
         .distinct
         .order(created_at: :desc)
         .ransack(params[:q])

    @minister_documents = @q.result(distinct: true).page(params[:page]).per(10)

    @directorate_id = current_user.directorate_id
    @directorate = Directorate.where(unit: true).find_by(id: @directorate_id)

  end

  def view_minister_doc_op_dg
    @comment_minister_document = @minister_document.comment_minister_documents.build
    
  end

  private
  def set_directorate_id
    @directorate_id = current_user.directorate_id
    @user_id = current_user.id
    @app_userid = User.find_by(id: @user_id) 
  end

  def set_minister_document_id
    @directorate_id = current_user.directorate_id
    @directorate = Directorate.where(unit: true).find_by(id: @directorate_id)
    @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.find_by(minister_document_id: params[:id])
    @minister_document = MinisterDocument.find_by(id: @minister_document_forward_directorate.minister_document_id)
    @minister_document_forward_natdirectorates = MinisterDocumentForwardNatdirectorate.find_by(minister_document_id: @minister_document, directorate_id: @directorate_id )
    @minister_document_natdirectorates = MinisterDocumentNatdirectorate.where(minister_document_forward_natdirectorate_id: @minister_document_forward_natdirectorates)
    @minister_document_forward_department_units = MinisterDocumentForwardDepartmentUnit.find_by(minister_document_id: @minister_document, directorate_id: @directorate_id )
    @minister_document_department_units = MinisterDocumentDepartmentUnit.where(minister_document_forward_department_unit_id: @minister_document_forward_department_units)
  end
  
end
