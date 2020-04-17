class CreateSummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :summaries do |t|
      t.integer :note_id
      t.string :title
      t.text :content
      t.integer :summary_number
      t.timestamps
    end
  end
end
