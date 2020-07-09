FactoryBot.define do

  factory :book do
    title     {"book"}
    author    {"neko"}
    image     {"book.jpg"}
    image_url {"https://image.com"}
    api_id    {"book1234"}
    publisher {"neko_publisher"}
  end

end