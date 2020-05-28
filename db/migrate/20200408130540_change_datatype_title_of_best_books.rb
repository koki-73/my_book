class ChangeDatatypeTitleOfBestBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :best_books, :best_book_id, 'integer USING CAST(best_book_id AS integer)'
    change_column :best_books, :second_book_id, 'integer USING CAST(second_book_id AS integer)'
    change_column :best_books, :third_book_id, 'integer USING CAST(third_book_id AS integer)'
  end
end
