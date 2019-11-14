class ArtworksController < ApplicationController
  before_action
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def index
    # user = User.find(params[:user_id]).shared_artworks
    render json: { created_artworks: Artwork.where(artist_id: params[:user_id]), shared_artworks: User.find(params[:user_id]).shared_artworks }
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private
  def handle_record_not_found
    render plain: "Artwork not found", status: :unprocessable_entity
  end

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end