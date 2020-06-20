class ChangeProgressOnActionPlans < ActiveRecord::Migration[5.2]
  def change
    change_column :action_plans, :progress, :integer, default: 0
  end
end
