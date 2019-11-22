class UsersController < ApplicationController
  before_action :already_signed_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      flash[:notice] = "User successfully created"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end

  def show
  
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def already_signed_in
    if !current_user.nil?
      redirect_to cats_url
    end
  end

end
