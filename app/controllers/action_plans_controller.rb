class ActionPlansController < ApplicationController
  
  def count_up
    @action_plan = ActionPlan.find(params[:id])
    progress = @action_plan.progress
    if progress.nil?
      progress = 1
    else
      progress += 1
    end
    @action_plan.update(progress: progress)
  end

  def count_down
    @action_plan = ActionPlan.find(params[:id])
    progress = @action_plan.progress
    if progress.nil? || progress == 0
      flash.now[:alert] = '0より低くできません'
      render template: "users/show"
    else
      progress -= 1
    end
    @action_plan.update(progress: progress)
  end
end
