class ChangeDatatypeTitleOfBestBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :best_books, :best_book_id, :integer
    change_column :best_books, :second_book_id, :integer
    change_column :best_books, :third_book_id, :integer
  end
end
