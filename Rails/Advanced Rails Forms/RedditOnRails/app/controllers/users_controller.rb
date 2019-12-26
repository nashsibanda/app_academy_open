class UsersController < ApplicationController
  before_action :ensure_logged_in, except: %i[index new create show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :ensure_logged_in, only: [:new, :create]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      flash[:notice] = "User #{@user.name} successfully created and logged in!"
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @user
      if @user.update(user_params)
        flash[:notice] = "User information successfully updated"
        redirect_to user_url(@user)
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to edit_user_url(@user)
      end
    else
      flash[:notice] = "User not found"
      redirect_to users_url
    end
  end

  def destroy
    if @user
      @user.destroy
      flash[:notice] = "User #{@user.name} successfully deleted."
      redirect_to users_url
    else
      flash[:notice] = "User not found"
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
