class RenameTitleColumnToBestBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :best_books, :best_book, :best_book_id
    rename_column :best_books, :second_best_book, :second_book_id
    rename_column :best_books, :third_best_book, :third_book_id
  end
end
