class CatFosterRequestsController < ApplicationController
  before_action
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def index
    @requests = CatFosterRequest.all.order(start_date: :desc)
    render :index
  end
  
  def new
    @cats = Cat.all
    @request = CatFosterRequest.new
    render :new
  end

  def create
    @request = CatFosterRequest.new(request_params)
    if @request.save
      redirect_to cat_foster_requests_url
    else
      @cats = Cat.all
      @failed = true
      render :new
    end
  end

  private
  def handle_record_not_found
    render plain: "Cat foster request not found", status: :unprocessable_entity
  end

  def request_params
    params.require(:cat_foster_request).permit(:cat_id, :start_date, :end_date)
  end
end