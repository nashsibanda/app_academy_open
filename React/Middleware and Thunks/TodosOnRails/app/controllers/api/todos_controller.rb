# frozen_string_literal: true

class Api::TodosController < ApplicationController
  before_action :current_todo, only: %i[update show destroy]
  before_action :ensure_logged_in

  def show
    render json: @todo
  end

  def create
    @todo = current_user.todos.new(todo_params)
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
    @todos = current_user.todos.all
    render json: @todos, include: :tags
  end

  def destroy
    @todo.destroy
    render json: @todo, include: :tags
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done, :due, tag_names: [])
  end

  def current_todo
    @todo = current_user.todos.find_by(id: params[:id])
  end
end
