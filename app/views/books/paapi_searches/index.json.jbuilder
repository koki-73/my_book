json.array! @items do |item|
  json.image_url item.image_url
  json.title item.title
  # authorsは配列で取得されるので使う場合は注意
  json.authors item.authors
  json.publisher item.publisher
  json.apiId item.asin
  json.url item.detail_url
end