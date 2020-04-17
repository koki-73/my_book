class LikesController < ApplicationController
  def create
    @like = Like.create(note_id: params[:note_id], user_id: current_user.id)
    redirect_to book_note_path(params[:book_id], params[:note_id])
  end

  def destroy
    @like = Like.find_by(note_id: params[:note_id], user_id: current_user.id)
    @like.destroy
    redirect_to book_note_path(params[:book_id], params[:note_id])
  end


end
