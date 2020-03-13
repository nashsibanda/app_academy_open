# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :ensure_logged_in, except: %i[new create]
  before_action :set_user, only: %i[destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      flash[:notice] = "User #{@user.username} successfully logged in!"
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url, status: 422
    end
  end

  def destroy
    if @user
      @user.destroy
      flash[:notice] = "User #{@user.username} successfully deleted."
      redirect_to new_session_url
    else
      flash[:errors] = ['User not found']
      redirect_to new_session_url
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
