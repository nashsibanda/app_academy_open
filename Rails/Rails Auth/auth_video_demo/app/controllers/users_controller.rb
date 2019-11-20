class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages
    end
  end

  def show
    redirect_to new_session_url if current_user.nil?
    @user = current_user
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end