class CommentMinisterDocumentController < ApplicationController
    before_action :authenticate_user!
    # load_and_authorize_resource
    def create
      @minister_document = MinisterDocument.find(params[:minister_document_id])
      @comment = @minister_document.comment_minister_documents.new(comment_params)
      if @comment.save
        # redirect_to @minister_document, notice: 'Comment was successfully created.'
        if current_user&.operator_minister?
          redirect_to @minister_document
        elsif current_user&.minister? 
          redirect_to view_minister_document_path(@minister_document)
        elsif current_user&.operator_dg?
          redirect_to view_minister_doc_op_dg_path(@minister_document)    
        elsif current_user&.directorate?
          redirect_to view_minister_document_dg_path(@minister_document)   
        elsif current_user&.operator_dn? or current_user&.natdirectorate?
          redirect_to view_minister_document_op_dn_path(@minister_document) 
        elsif current_user&.staff? or current_user&.department?
          redirect_to view_minister_document_dep_path(@minister_document)   
        end
       
  
      else
        redirect_to root_path, alert: 'Error creating comment.'
      end
    end
  
    private
    def comment_params
      params.require(:comment_minister_document).permit(:comment).merge(user_id: current_user.id)
    end
end
