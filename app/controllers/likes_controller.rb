class LikesController < ApplicationController
  def create
    @like = Like.create(note_id: params[:note_id], user_id: current_user.id)
    @note = Note.find(params[:note_id])
    @book = @note.book
    @likes = Like.where(note_id: @note.id)
  end

  def destroy
    @like = Like.find_by(note_id: params[:note_id], user_id: current_user.id)
    @like.destroy
    @note = Note.find(params[:note_id])
    @book = @note.book
    @likes = Like.where(note_id: @note.id)
  end

end
