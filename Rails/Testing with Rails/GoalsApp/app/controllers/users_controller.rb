class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully created!"
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
      flash[:notice] = "User #{@user.email} successfully deleted"
      redirect_to users_url
    else
      flash[:errors] = "User not found"
      redirect_to users_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
