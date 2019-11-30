class NotesController < ApplicationController
  before_action :ensure_logged_in_user

  def new
    @note = Note.new(track_id: params[:track_id], user_id: current_user.id)
  end

  def create
    @note = Note.new(note_params)
    # @note.update(note_params)
    if @note.save
      redirect_to track_url(@note.track)
    else
      redirect_to track_url(@note.track)
    end
  end

  def edit
  
  end

  def update
  
  end

  def destroy
  
  end

  private
  def note_params
    params[:note][:user_id] = current_user.id
    params.require(:note).permit(:text, :track_id, :user_id)
  end
  
end