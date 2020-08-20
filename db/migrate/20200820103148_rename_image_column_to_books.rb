class RenameImageColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :image, :text
    rename_column :books, :image, :amazon_url
  end
end
