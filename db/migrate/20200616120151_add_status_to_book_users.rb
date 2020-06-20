class AddStatusToBookUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :book_users, :status, :integer
  end
end
