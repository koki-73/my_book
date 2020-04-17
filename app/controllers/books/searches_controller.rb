class Books::SearchesController < ApplicationController
  def index
    @books = Book.search(params[:keyword])
  end
end
