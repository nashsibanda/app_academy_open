class VotesController < ApplicationController
  before_action :ensure_logged_in

  def create
    if params[:comment_id]
      parent = Comment.friendly.find(params[:comment_id])
    elsif params[:post_id]
      parent = Post.friendly.find(params[:post_id])
    end
    @vote = Vote.new(vote_params)
    @vote.voter_id = current_user.id
    @vote.votable = parent
    if @vote.save
      redirect_back(fallback_location: root_url)
    else
      flash[:errors] = @vote.errors.full_messages
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
    @vote = Vote.friendly.find(params[:id])
    @vote.destroy
    flash[:notice] = "Vote deleted!"
    redirect_back(fallback_location: root_url)
  end

  private
  def vote_params
    params.require(:vote).permit(:value)
  end
end