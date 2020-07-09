FactoryBot.define do

  factory :user do
    nickname              {"neko"}
    email                 {"neko@gmail.com"}
    password              {"nyannyan"}
    password_confirmation {"nyannyan"}
    profile               {"hello"}
  end

end