json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.author book.author
  json.image book.origin_image_url
end