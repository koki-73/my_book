class CreatePurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :purposes do |t|
      t.string :content
      t.references :note, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
