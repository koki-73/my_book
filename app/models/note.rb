class Note < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :summaries
  has_many :reviews
  has_many :action_plans
  has_many :comments
  has_many :likes

  validates :user_id, uniqueness: {scope: :book_id}
end
