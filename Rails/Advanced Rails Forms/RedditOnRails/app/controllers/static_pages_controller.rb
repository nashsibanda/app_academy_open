class StaticPagesController < ApplicationController
  def front_page
    @posts = Post.includes(:author, :sub, :votes).all.order(created_at: :desc)
    @posts = @posts.sort { |a, b| b.vote_value <=> a.vote_value }
  end
end