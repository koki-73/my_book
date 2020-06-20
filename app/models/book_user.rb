class BookUser < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status:{
    unread: 0,
    reading: 1,
    finished: 2
  }
end
