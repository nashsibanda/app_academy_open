class Api::Bench < ApplicationRecord
  validates_presence_of :description, :lat, :lng, message: "can't be blank"
end
