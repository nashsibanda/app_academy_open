class BandsController < ApplicationController
  def index
    @bands = Band.all.order(name: :asc)
  end
end