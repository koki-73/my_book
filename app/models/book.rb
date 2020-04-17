class Book < ApplicationRecord
  has_many :book_users
  has_many :users, through: :book_users
  has_many :notes

  validates :title, presence: true
  validates :author, presence: true
  validates :title, uniqueness: {scope: :author}

  def self.search(search)
    return Book.all unless search
    Book.where('title LIKE(?) OR author LIKE(?)', "%#{search}%", "%#{search}%")
  end
end
