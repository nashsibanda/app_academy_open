# frozen_string_literal: true

class Api::TodosController < ApplicationController
  before_action :current_todo, only: %i[update show destroy]

  def show
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, include: :tags
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo, include: :tags
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def index
    @todos = Todo.all
    render json: @todos, include: :tags
  end

  def destroy
    @todo.destroy
    render json: @todo, include: :tags
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done, :due, :tag_names)
  end

  def current_todo
    @todo = Todo.find_by(id: params[:id])
  end
end
