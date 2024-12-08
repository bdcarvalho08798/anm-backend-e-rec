class CommentDocumentDgController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  def create
    @document_from_dg = DocumentFromDg.find(params[:document_from_dg_id])
    @comment = @document_from_dg.comment_document_dgs.new(comment_params)
    if @comment.save
      # redirect_to @document_from_dg, notice: 'Comment was successfully created.'
      if current_user&.operator_dg?
        redirect_to @document_from_dg 
      elsif current_user&.directorate?
        redirect_to view_document_dg_path(@document_from_dg)     
      elsif current_user&.operator_dn?
        redirect_to view_doc_dg_path(@document_from_dg)         
      elsif current_user&.natdirectorate?
        redirect_to view_doc_dg_path(@document_from_dg)      
      elsif current_user&.department?
        redirect_to view_document_from_dg_path(@document_from_dg)    
      elsif current_user&.staff?
        redirect_to view_doc_dg_by_staff_path(@document_from_dg)  
      elsif current_user&.minister?
        redirect_to view_document_from_dg_minister_path(@document_from_dg)
      elsif current_user&.operator_minister?
        redirect_to view_document_from_dg_op_minister_path(@document_from_dg)
      end
     

    else
      redirect_to root_path, alert: 'Error creating comment.'
    end
  end

  private

  def comment_params
    params.require(:comment_document_dg).permit(:comment).merge(user_id: current_user.id)
  end
end
