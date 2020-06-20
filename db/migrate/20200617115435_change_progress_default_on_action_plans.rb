class ChangeProgressDefaultOnActionPlans < ActiveRecord::Migration[5.2]
  def change
    change_column_default :action_plans, :progress, default: 0
  end
end
