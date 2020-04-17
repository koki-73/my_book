class Summary < ApplicationRecord
  belongs_to :note

  validates :title, presence: true
  validates :content, presence: true
end
