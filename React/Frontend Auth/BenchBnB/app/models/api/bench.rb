# frozen_string_literal: true

class Api::Bench < ApplicationRecord
  validates_presence_of :description, :lat, :lng, message: "can't be blank"

  def self.in_bounds(bounds)
    # google map bounds will be in the following format:
    # {
    #   "northEast"=> {"lat"=>"37.80971", "lng"=>"-122.39208"},
    #   "southWest"=> {"lat"=>"37.74187", "lng"=>"-122.47791"}
    # }
    north = bounds['northEast']['lat'].to_f
    east = bounds['northEast']['lng'].to_f
    south = bounds['southWest']['lat'].to_f
    west = bounds['southWest']['lng'].to_f
    Api::Bench
      .where('lat < ?', north)
      .where('lat > ?', south)
      .where('lng < ?', east)
      .where('lng > ?', west)
  end
end
