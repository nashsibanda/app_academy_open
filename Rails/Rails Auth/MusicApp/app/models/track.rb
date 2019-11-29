class Track < ApplicationRecord
  validates :title, :ord, :album_id, presence: true

  belongs_to :album
end