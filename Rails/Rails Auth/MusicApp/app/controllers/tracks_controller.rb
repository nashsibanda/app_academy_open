class TracksController < ApplicationController
  def new
    @track = Track.new(album_id: params[:album_id])
    @bands = Band.includes(:albums).order(name: :asc)
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      redirect_to bands_url
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
  end

  private
  def track_params
    params.require(:track).permit(:title, :album_id, :ord, :lyrics, :bonus)
  end
end