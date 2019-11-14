class UsersController < ApplicationController
  before_action
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def index
    render json: User.all
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.error.full_messages, status: :unprocessable_entity
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def handle_record_not_found
    render plain: "User not found", status: :unprocessable_entity
  end

end