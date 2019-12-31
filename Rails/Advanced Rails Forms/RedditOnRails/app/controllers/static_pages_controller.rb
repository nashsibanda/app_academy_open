class StaticPagesController < ApplicationController
  def front_page
    @posts = Post.includes(:author, :sub).all
  end
end