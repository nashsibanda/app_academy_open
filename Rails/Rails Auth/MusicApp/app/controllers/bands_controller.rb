class BandsController < ApplicationController
  before_action :ensure_logged_in_user
  
  def index
    @bands = Band.all.order(name: :asc)
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:notice] = "#{@band.name} successfully added to artists!"
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      redirect_to band_url(@band)
    end
  end

  def destroy
    Band.find_by(id: params[:id]).destroy
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end