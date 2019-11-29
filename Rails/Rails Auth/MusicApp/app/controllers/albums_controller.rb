class AlbumsController < ApplicationController
  def new
    @album = Album.new(band_id: params[:band_id])
    @bands = Band.all.order(name: :asc)
  end

  def create
    @album = Album.new(album_params)
    if @album.save!
      redirect_to album_url(@album)
    else
      redirect_to bands_url
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