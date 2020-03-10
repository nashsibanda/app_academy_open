# frozen_string_literal: true

class Api::TodosController < ApplicationController
  before_action :current_todo, only: %i[update show destroy]

  def show
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def index
    @todos = Todo.all
    render json: @todos
  end

  def destroy
    @todo.destroy
    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done, :due)
  end

  def current_todo
    @todo = Todo.find_by(id: params[:id])
  end
end
