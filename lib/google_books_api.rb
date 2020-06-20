module GoogleBooksApi
  require 'net/http'

  def get_json_from_url(url)
    JSON.parse(Net::HTTP.get(URI.parse(URI.encode(url))))
  end

  # ①検索するAPIを叩く
  def url_from_keyword(keyword)
    "https://www.googleapis.com/books/v1/volumes?q=#{keyword}&country=JP&maxResults=20"
  end

  # ②IDから本の情報を取得するAPIを叩く
  def url_from_id(googlebooksapi_id)
    "https://www.googleapis.com/books/v1/volumes/#{googlebooksapi_id}"
  end
end