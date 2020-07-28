FactoryBot.define do

  factory :book do
    title     { Faker::Book.title }
    author    { Faker::Book.author }
    image     { "book.jpg" }
    image_url { "https://image.com" }
    api_id    { Faker::Code.isbn }
    publisher { Faker::Book.publisher }
  end

end