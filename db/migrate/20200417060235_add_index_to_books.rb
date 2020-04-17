class AddIndexToBooks < ActiveRecord::Migration[5.2]
  def change
    add_index :books, :title
  end
end
