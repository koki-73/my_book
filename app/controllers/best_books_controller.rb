class BestBooksController < ApplicationController

  def new
    @user = User.find(current_user.id)
    @best_book = BestBook.new
    @books = @user.books
  end

  def edit
    @user = User.find(current_user.id)
    @best_book = BestBook.find(params[:id])
    @books = @user.books
  end


  def create
    BestBook.create(best_book_params)
    redirect_to user_path(current_user.id)
  end

  def update
    # binding.pry
    BestBook.update(best_book_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    
  end

  private
  def best_book_params
    params.require(:best_book).permit(:best_book_id, :second_book_id, :third_book_id).merge(user_id: current_user.id)
  end
end
