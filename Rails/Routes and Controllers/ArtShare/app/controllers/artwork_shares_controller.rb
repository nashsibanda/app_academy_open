class ArtworkSharesController < ApplicationController
  before_action
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def create
      share = ArtworkShare.new(share_params)
      if share.save
        render json: share
      else
        render json: share.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      share = ArtworkShare.find(params[:id])
      share.destroy
      render json: share
    end
  private
  def handle_record_not_found
    render plain: "Artwork share not found", status: :unprocessable_entity
  end

  def share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end