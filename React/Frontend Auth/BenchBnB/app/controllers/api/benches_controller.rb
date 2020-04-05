# frozen_string_literal: true

class Api::BenchesController < ApplicationController
  def index
    benches = bounds ? Api::Bench.in_bounds(bounds) : Api::Bench.all

    if params[:minSeating] && params[:maxSeating]
      benches = benches.where(seating: seating_range)
    end
    @benches = benches
    render :index
  end

  def create
    @bench = Api::Bench.new(bench_params)
    if @bench.save
      render json: @bench
    else
      render json: @bench.errors.full_messages, status: 422
    end
  end

  private

  def bench_params
    params.require(:bench).permit(:description, :lat, :lng, :seating)
  end

  def seating_range
    (params[:minSeating]..params[:maxSeating])
  end

  def bounds
    params[:bounds]
  end
end
