class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      BookUser.create(book_id: @book.id, user_id: current_user.id)
      redirect_to user_path(current_user.id)
    else
      if @book.title == ""
        flash.now[:error] = "タイトルを入力してください"
      else
        flash.now[:error] = "その本はすでに登録されています"
      end
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_notes_path(book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
