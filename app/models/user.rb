class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :book_users
  has_many :books, through: :book_users
  has_many :action_plans
  has_many :notes
  has_many :comments
  has_many :likes
  has_one :best_book

  validates :nickname, presence: true
  validates :email, uniqueness: true

  def already_liked?(note)
    self.likes.exists?(note_id: note.id)
  end

  def already_read?(book)
    self.book_users.exists?(book_id: book.id, user_id: self.id)
  end
end
