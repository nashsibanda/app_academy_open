class CommentsController < ApplicationController
  def create
    if params[:user_id]
      parent = User.find_by(params[:user_id])
    elsif params[:goal_id]
      parent = Goal.find_by(params[:goal_id])
    else
      flash[:errors] = ["Commentable parent object not found."]
      redirect_back(fallback_location: root_url)
    end
    @comment = Comment.new(comment_params)
    @comment.commentable = parent
    if @comment.save
      flash[:notice] = "Comment successfully added!"
      redirect_back(fallback_location: root_url)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_back(fallback_location: root_url)
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.commenter_id == current_user.id
      if @comment.update(comment_params)
        flash[:notice] = "Comment successfully updated!"
        redirect_back(fallback_location: root_url)
      else
        flash[:errors] = @comment.errors.full_messages
        redirect_back(fallback_location: root_url)
      end
    else
      flash[:errors] = ["Can't edit a comment written by another user."]
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    if @comment.commenter_id == current_user.id
      @comment.destroy
      flash[:notice] = "Comment successfully deleted!"
      redirect_back(fallback_location: root_url)
    else
      flash[:errors] = ["Can't delete a comment written by another user."]
      redirect_back(fallback_location: root_url)
    end
  end

  private
  def comment_params
    params[:note][:commenter_id] = current_user.id
    params.require(:comment).permit(:text, :commenter_id)
  end
end