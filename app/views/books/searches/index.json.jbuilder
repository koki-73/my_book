json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.author book.author
end