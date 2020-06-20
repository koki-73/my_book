class BooksController < ApplicationController
  include GoogleBooksApi

  before_action :move_to_top, except: :index

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @book.book_users.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to user_path(current_user.id)
    else
      book = Book.find_by(api_id: book_params[:api_id])
      if BookUser.find_by(book_id: book.id, user_id: current_user.id)
        flash.now[:error] = "すでに本を追加しています"
        render "new"
      else
        book_user_params = book_params[:book_users_attributes]["0"].merge(book_id: book.id)
        BookUser.create(book_user_params)
        redirect_to user_path(current_user.id)
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_notes_path(@book.id)
    else
      flash.now[:error] = "入力項目を確認してください"
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:image_url, :title, :author, :publisher, :api_id, :image, book_users_attributes: [:status, :user_id, :_destroy, :id])
  end

  def move_to_top
    redirect_to root_path unless user_signed_in?
  end
end
