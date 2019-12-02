class AlbumsController < ApplicationController
  before_action :ensure_logged_in_user
  
  def new
    @album = Album.new(band_id: params[:band_id])
    @bands = Band.all.order(name: :asc)
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "#{@album.title} successfully added to #{@album.band.name} albums!"
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(@album.band_id)
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @bands = Band.all.order(name: :asc)
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      redirect_to album_url(@album)
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  def destroy
    Album.find_by(id: params[:id]).destroy
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :title, :year, :live)
  end
end