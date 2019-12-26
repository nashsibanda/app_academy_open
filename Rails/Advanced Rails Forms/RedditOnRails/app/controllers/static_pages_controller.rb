class StaticPagesController < ApplicationController
  def front_page
    @posts = Post.all
  end
end