class CommentDocumentDnController < ApplicationController
    def create
        @document_from_dn = DocumentFromDn.find(params[:document_from_dn_id])
        @comment = @document_from_dn.comment_document_dns.new(comment_params)
        if @comment.save
          if current_user&.directorate?
            redirect_to view_document_dn_path(@document_from_dn)  
          elsif current_user&.natdirectorate?
            redirect_to view_doc_from_dn_path(@document_from_dn)  
          elsif current_user&.department?
            redirect_to view_dcmt_from_dn_path(@document_from_dn)  
          elsif current_user&.staff?
            redirect_to view_doc_dn_path(@document_from_dn)  
          else
            redirect_to @document_from_dn
          end 
        else
          # redirect_to @document_from_dn, alert: 'Error creating comment.'
          redirect_to root_path, alert: 'Error creating comment.'
        end
      end
    
      private
    
      def comment_params
        params.require(:comment_document_dn).permit(:comment).merge(user_id: current_user.id)
      end
end
