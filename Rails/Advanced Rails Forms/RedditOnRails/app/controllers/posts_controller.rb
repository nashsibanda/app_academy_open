class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, except: [:show]
  before_action :require_author_access, only: [:edit, :update, :destroy]

  # GET /posts/1
  # GET /posts/1.json
  def show
    # @all_comments = @post.comments.includes(:author)
    @comments_by_parent_id = @post.comments_by_parent_id
  end

  # GET /posts/new
  def new
    parent_sub = Sub.friendly.find(params[:sub_id])
    @post = Post.new(sub: parent_sub)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.author = current_user
    parent = Sub.friendly.find(params[:sub_id])
    @post.sub = parent
    if @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_sub_post_url(parent)
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated!"
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to @post
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.includes(:author).friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :url, :sub_id)
    end

    def require_author_access
      post = Post.friendly.find(params[:id])
      unless post.author == current_user || post.sub.moderators.include?(current_user)
        flash[:error] = "Only the post author or a moderator can perform this action."
        redirect_to sub_url(sub)
      end
    end
end
