class NotesController < ApplicationController
  before_action :ensure_logged_in_user

  def create
    @note = Note.new(note_params)
    # @note.update(note_params)
    if @note.save
      redirect_to track_url(@note.track)
    else
      redirect_to track_url(@note.track)
    end
  end

  def update
  
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    if @note.user_id == current_user.id
      @note.destroy
      redirect_to track_url(@note.track_id)
    else
      render plain: "Can't delete note written by another user", status: :forbidden
    end
  end

  private
  def note_params
    params[:note][:user_id] = current_user.id
    params.require(:note).permit(:text, :track_id, :user_id)
  end
  
end