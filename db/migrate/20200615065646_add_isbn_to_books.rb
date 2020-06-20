class AddIsbnToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :api_id, :string
  end
end
