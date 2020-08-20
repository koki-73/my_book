json.array! @items do |item|
  json.image_url item.image_url
  json.title item.title
  # authorsは公式リファレンスどおりに"item.authors"で取得できないので以下のように取得（公式のメソッドが間違っている可能性あり）
  # authorsは配列で取得されるので使う場合は注意
  json.authors item.contributors.select { |e| e['RoleType'] == "author" }&.map { |e| e.dig('Name') }&.reject {|n| n.to_s.empty?}
  json.publisher item.publisher
  json.apiId item.asin
  json.url item.detail_url
end