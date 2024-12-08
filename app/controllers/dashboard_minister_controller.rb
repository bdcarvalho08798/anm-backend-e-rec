class DashboardMinisterController < ApplicationController
  before_action :set_minister_document, only: %i[ view_minister_document ]
  before_action :set_document_from_dg, only: %i[  view_document_from_dg_minister ]

  def index
    @q = MinisterDocument.order(created_at: :desc).ransack(params[:q])
    @minister_documents = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_minister_document
    @comment_minister_document = @minister_document.comment_minister_documents.build
  end

  def document_dg_minister 
    @q = DocumentFromDg
    .joins(:document_dg_forward_ministers)
    .where(document_dg_forward_ministers: { document_from_dg_id: DocumentFromDg.select(:id) })
    .distinct
    .order(created_at: :desc).ransack(params[:q])

    @document_from_dgs = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_document_from_dg_minister
    @comment_document_dg = @document_from_dg.comment_document_dgs.build
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_minister_document
    @minister_document = MinisterDocument.find(params[:id])
    @minister_document_forward_directorate = MinisterDocumentForwardDirectorate.find_by(minister_document_id: @minister_document )
    @minister_document_directorates = MinisterDocumentDirectorate.where(minister_document_forward_directorate_id: @minister_document_forward_directorate)
  end

  def set_document_from_dg
    @document_from_dg = DocumentFromDg.find(params[:id])
    @document_dg_forward_ministers = DocumentDgForwardMinister.find_by(document_from_dg_id: @document_from_dg)
  end


end
 