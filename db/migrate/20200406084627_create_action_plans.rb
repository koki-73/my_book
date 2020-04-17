class CreateActionPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :action_plans do |t|
      t.string :content
      t.integer :user_id
      t.integer :note_id

      t.timestamps
    end
  end
end
