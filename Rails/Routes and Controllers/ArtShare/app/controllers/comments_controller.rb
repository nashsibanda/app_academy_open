class CommentsController < ApplicationController
  before_action
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  
  def index
    if params[:artwork_id]
      comments = Comment.where(artwork_id: params[:artwork_id])
    elsif params[:user_id]
      comments = Comment.where(commenter_id: params[:user_id])
    else
      comments = Comment.all
    end
    render json: comments
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  private

  def handle_record_not_found
    render plain: "Comment not found", status: :unprocessable_entity
  end

  def comment_params
    params.require(:comment).permit(:artwork_id, :commenter_id, :body)
  end
end