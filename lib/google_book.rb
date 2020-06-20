class GoogleBook
  attr_reader :googlebooksapi_id, :author, :buy_link, :description, :image, :published_at, :publisher, :title

  class << self
    include GoogleBooksApi

    def new_from_id(googlebooksapi_id)
      url = url_from_id(googlebooksapi_id)
      item = get_json_from_url(url)
      new(item)
    end

    def search(keyword)
      url = url_of_searching_from_keyword(keyword)
      json = get_json_from_url(url)
      books = []
      if items = json['items']
        items.each do |item|
          books << GoogleBook.new(item)
        end
      end
      books
    end
  end

  def initialize(item)
    @item = item
    @volume_info = @item['volumeInfo']
    retrieve_attribute
  end

  def retrieve_attribute
    @googlebooksapi_id = @item['id']
    @author = @volume_info['authors']&.first
    @buy_link = @item['saleInfo']['buyLink']
    @description = @volume_info['description']
    @image = @volume_info['imageLinks']['smallThumbnail']
    @published_at = @volume_info['publishedDate']
    @title = @volume_info['title']
  end
end