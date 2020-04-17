class Books::SearchesController < ApplicationController
  def index
    @books = Book.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
