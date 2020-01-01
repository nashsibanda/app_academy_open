class CrosspostsController < ApplicationController
  def create
    parent = Post.friendly.find(params[:post_id])
    crosspost = parent.dup
    crosspost.crosspost_parent_id = parent.id
    crosspost.author_id = current_user.id
    crosspost.sub_id = params[:crosspost][:sub_id]
    if crosspost.save
      flash[:notice] = "Post successfully crossposted to #{crosspost.sub.name}!"
      redirect_to crosspost
    else
      flash[:errors] = crosspost.errors.full_messages
      redirect_to parent
    end
  end
end