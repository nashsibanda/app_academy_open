# frozen_string_literal: true

class Api::StepsController < ApplicationController
  before_action :current_step, only: %i[update destroy]
  before_action :ensure_logged_in

  def create
    @step = Step.new(step_params)
    if @step.save
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def update
    if @step.update(step_params)
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def index
    @steps = Todo.find_by(id: params[:todo_id]).steps
    render json: @steps
  end

  def destroy
    @step.destroy
    render json: @step
  end

  private

  def step_params
    params.require(:step).permit(:title, :body, :done, :todo_id)
  end

  def current_step
    @step = Step.find_by(id: params[:id])
  end
end
