class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(user)
    else
      redirect_to new_user_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
