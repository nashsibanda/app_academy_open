class CatFosterRequestsController < ApplicationController
  before_action
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def new
    @cats = Cat.all.order(name: :asc)
    @request = CatFosterRequest.new
    render :new
  end

  def create
    @request = CatFosterRequest.new(request_params)
    if @request.save
      flash[:notice] = 'Foster request successfully made!'
      redirect_to cat_url(@request.cat_id)
    else
      @cats = Cat.all.order(name: :asc)
      flash.now[:errors] = @request.errors.full_messages
      render :new
    end
  end

  def approve
    @request = CatFosterRequest.find_by(id: params[:id])
    @request.approve!
    redirect_to cat_url(@request.cat_id)
  end

  def deny
    @request = CatFosterRequest.find_by(id: params[:id])
    @request.deny!
    redirect_to cat_url(@request.cat_id)
  end

  private
  def handle_record_not_found
    render plain: "Cat foster request not found", status: :unprocessable_entity
  end

  def request_params
    params.require(:cat_foster_request).permit(:cat_id, :start_date, :end_date)
  end
end