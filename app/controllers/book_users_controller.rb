class BookUsersController < ApplicationController

  def create
    @book_user = BookUser.create(book_id: params[:format], user_id: current_user.id)
    redirect_to book_notes_path(params[:format])
  end
  
  def destroy
    @book_user = BookUser.find(params[:id])
    if Note.find_by(book_id: @book_user.book_id, user_id: current_user.id)
      flash[:alert] = "ノートを作成済みのため取り消せません"
      redirect_to book_notes_path(@book_user.book_id)
    else
      @book_user.destroy
      redirect_to book_notes_path(@book_user.book_id)
    end
  end
end
