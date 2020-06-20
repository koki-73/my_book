class Note < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :summaries, dependent: :destroy
  accepts_nested_attributes_for :summaries, allow_destroy: true
  has_one :review, dependent: :destroy
  accepts_nested_attributes_for :review, allow_destroy: true
  has_many :action_plans, dependent: :destroy
  accepts_nested_attributes_for :action_plans, allow_destroy: true
  has_one :purpose, dependent: :destroy
  accepts_nested_attributes_for :purpose, allow_destroy: true
  has_one :memo, dependent: :destroy
  accepts_nested_attributes_for :memo, allow_destroy: true
  has_many :comments
  has_many :likes
  
  validates :user_id, uniqueness: {scope: :book_id}
  # include ActiveModel::Validations
  # validates_with NoteValidator

  def summary_exists?
    self.summaries.each do |s|
      if s.title.present? && s.content.present?
        return true
      end
    end
    return false
  end
end
