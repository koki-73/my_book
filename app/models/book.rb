class Book < ApplicationRecord
  has_many :book_users
  has_many :users, through: :book_users
  has_many :notes

  validates :title, presence: true
  validates :author, presence: true
  validates :title, uniqueness: {scope: :author}
end
