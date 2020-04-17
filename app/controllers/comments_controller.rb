class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to book_note_path(params[:book_id], params[:note_id])
  end


  private
  def comment_params
    params.require(:comment).permit(:content).merge(note_id: params[:note_id], user_id: current_user.id)
  end
end
