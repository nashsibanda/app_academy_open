# frozen_string_literal: true

class Api::GuestsController < ApplicationController
  def index
    @guests = Guest.all
    render :index
  end

  def show
    @guest = Guest.find_by(id: params[:id]).includes(:gifts)
    render :show
  end
end
