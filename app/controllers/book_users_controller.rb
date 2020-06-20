class BookUsersController < ApplicationController

  def create
    BookUser.create(book_user_params)
    redirect_to book_notes_path(book_user_params[:book_id])
  end

  def update
    book_user = BookUser.find_by(book_id: book_user_params_update[:book_id], user_id: current_user.id)
    book_user.update(book_user_params_update)
    redirect_to user_path(current_user.id)
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

  private

  def book_user_params
    params.permit(:status, :book_id).merge(user_id: current_user.id)
  end

  def book_user_params_update
    params.require(:book_user).permit(:status, :book_id).merge(user_id: current_user.id)
  end
end
