class Note < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :summaries, dependent: :destroy
  accepts_nested_attributes_for :summaries, allow_destroy: true
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews, allow_destroy: true
  has_many :action_plans, dependent: :destroy
  accepts_nested_attributes_for :action_plans, allow_destroy: true
  has_many :comments
  has_many :likes

  validates :user_id, uniqueness: {scope: :book_id}
end
