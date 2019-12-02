class TracksController < ApplicationController
  before_action :ensure_logged_in_user
  
  def new
    @track = Track.new(album_id: params[:album_id])
    @bands = Band.includes(:albums).order(name: :asc)
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:notice] = "#{@track.title} successfully added to #{@track.album.title}!"
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to bands_url
    end
  end

  def show
    @track = Track.includes(:album).find_by(id: params[:id])
  end

  private
  def track_params
    params.require(:track).permit(:title, :album_id, :ord, :lyrics, :bonus)
  end
end