class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @notes = Note.where(user_id: params[:id])
    @likes = Like.where(user_id: params[:id])
    @best_book = BestBook.find_by(user_id: params[:id])
  end

end
