class AddProgressToActionPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :action_plans, :progress, :integer
  end
end
