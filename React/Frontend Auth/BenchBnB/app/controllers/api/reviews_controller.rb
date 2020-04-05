# frozen_string_literal: true

class Api::ReviewsController < ApplicationController
  def index
    # @reviews = Api::Review.all
    reviews = bench_id ? Api::Review.includes(:user).where(api_bench_id: bench_id) : Api::Review.includes(:user).all
    @reviews = reviews
    render :index
  end

  def create
    @review = Api::Review.new(review_params)
    if @review.save
      render json: @review
    else
      render json: @review.errors.full_messages, status: 422
    end
  end

  def show
    @review = Api::Review.includes(:user).find_by(id: params[:id])
  end

  private

  def bench_id
    params[:bench_id]
  end

  def review_params
    params.require(:review).permit(:comment, :api_bench_id, :user_id, :rating)
  end
end
