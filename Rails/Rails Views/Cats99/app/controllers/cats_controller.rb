include ActionView::Helpers::DateHelper

class CatsController < ApplicationController
  before_action
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  
  def index
    @cats_selection = Cat.all
    render :index
  end

  def show
    @this_cat = Cat.find_by(id: params[:id] )
    render :show
  end

  private

  def cat_params
    # params.require(:cat).permit(:name)
  end

  def handle_record_not_found
    render plain: "User not found", status: :unprocessable_entity
  end

end