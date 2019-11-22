class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully created"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
  end

  def show
  
  end

  private
  def user_params
    params.require(:users).permit(:username, :password)
  end

end
