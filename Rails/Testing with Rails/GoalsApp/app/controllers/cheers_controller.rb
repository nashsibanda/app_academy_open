class CheersController < ApplicationController

  def create
    if params[:user_id]
      parent = User.find_by(id: params[:user_id])
    elsif params[:goal_id]
      parent = Goal.find_by(id: params[:goal_id])
    elsif params[:comment_id]
      parent = Comment.find_by(id: params[:comment_id])
    else
      flash[:errors] = ["Cheerable parent object not found."]
      redirect_back(fallback_location: root_url)
    end
    @cheer = Cheer.new(cheer_params)
    @cheer.cheerable = parent
    if @cheer.save
      flash[:notice] = "Cheer successfully added!"
      redirect_back(fallback_location: root_url)
    else
      flash[:errors] = @cheer.errors.full_messages
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
    @cheer = Cheer.find_by(id: params[:id])
    if @cheer.cheerer_id == current_user.id
      @cheer.destroy
      flash[:notice] = "Cheer successfully deleted!"
      redirect_back(fallback_location: root_url)
    else
      flash[:errors] = ["Can't delete a cheer written by another user."]
      redirect_back(fallback_location: root_url)
    end
  end

  private
  def cheer_params
    params[:cheer] = {}
    params[:cheer][:cheerer_id] = current_user.id
    params.require(:cheer).permit(:cheerer_id)
  end

end