class CreateBestBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :best_books do |t|
      t.integer :user_id
      t.string :best_book
      t.string :second_best_book
      t.string :third_best_book
      t.timestamps
    end
  end
end
