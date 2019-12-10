class GoalsController < ApplicationController
  
  def new
    @goal = Goal.new(user_id: params[:user_id])
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      flash[:notice] = "Goal '#{@goal.title}' successfully added!"
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to new_user_goal_url(current_user)
    end
  end

  def show
    @goal = Goal.find_by(id: params[:id])
  end

  def edit
  
  end

  def update
  
  end

  def delete
  
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :details, :private, :complete, :deadline)
  end

end
