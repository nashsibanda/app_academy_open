class UsersController < ApplicationController
  before_action :ensure_logged_in_user, except: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      flash[:notice] = "User '#{@user.email}' successfully added!"
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
