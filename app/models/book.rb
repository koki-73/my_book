class Book < ApplicationRecord
  has_many :book_users
  accepts_nested_attributes_for :book_users, allow_destroy: true
  has_many :users, through: :book_users
  has_many :notes

  validates :title, presence: true
  validates :author, presence: true
  validates :api_id, uniqueness: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Book.all unless search
    Book.where('title LIKE(?) OR author LIKE(?)', "%#{search}%", "%#{search}%")
  end

  def substitute_for_googlebook(google_book)
    self.author = google_book.author
    self.description = google_book.description
    self.googlebooksapi_id = google_book.googlebooksapi_id
    self.published_at = google_book.published_at
    self.title = google_book.title
    self.buy_link = google_book.buy_link
    self.image = google_book.image
    self
  end

  def api_image
    GoogleBook.new_from_id(self.api_id).image
  end

  def api_title
    GoogleBook.new_from_id(self.api_id).title
  end

  def origin_image_url
    self[:image_url]
  end

  default_scope -> { order(created_at: :desc) }
end
