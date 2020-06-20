class RemoveUserIdFromPurposes < ActiveRecord::Migration[5.2]
  def change
    remove_column :purposes, :user_id, :integer
  end
end
