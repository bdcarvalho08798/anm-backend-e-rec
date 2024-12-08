class DashboardOperatorMinisterController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document_from_dg, only: %i[  view_document_from_dg_op_minister ]
  before_action :set_userid, only: %i[index ]

  def index

    @q = DocumentFromDg
    .joins(:document_dg_forward_ministers)
    .where(document_dg_forward_ministers: { document_from_dg_id: DocumentFromDg.select(:id) })
    .distinct
    .order(created_at: :desc).ransack(params[:q])

    @document_from_dgs = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def view_document_from_dg_op_minister
    @comment_document_dg = @document_from_dg.comment_document_dgs.build
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_from_dg
      @document_from_dg = DocumentFromDg.find(params[:id])
      @document_dg_forward_ministers = DocumentDgForwardMinister.find_by(document_from_dg_id: @document_from_dg)
    end


    def set_userid
      @user_id = current_user.id
      @app_userid = User.find_by(id: @user_id) 
    end 

  
end
