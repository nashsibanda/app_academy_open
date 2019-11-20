include ActionView::Helpers::DateHelper

class CatsController < ApplicationController
  before_action
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  
  def index
    @cats_selection = Cat.all.order(name: :asc)
    render :index
  end

  def show
    @this_cat = Cat.find_by(id: params[:id] )
    render :show
  end

  def new
    @this_cat = Cat.new
    render :new
  end

  def create
    @this_cat = Cat.new(cat_params)
    if @this_cat.save
      flash[:notice] = 'Cat successfully added!'
      redirect_to cat_url(@this_cat)
    else
      flash.now[:errors] = @this_cat.errors.full_messages
      render :new
    end
  end

  def edit
    @this_cat = Cat.find_by(id: params[:id])
    if @this_cat
      render :edit
    else
      redirect_to cats_url
    end
  end

  def update
    @this_cat = Cat.find_by(id: params[:id])
    if @this_cat.update(cat_params)
      flash[:notice] = 'Cat successfully edited!'
      redirect_to cat_url(@this_cat)
    else
      flash.now[:errors] = @this_cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :sex, :color, :description, :birth_date)
  end

  def handle_record_not_found
    render plain: "Cat not found", status: :unprocessable_entity
  end

end