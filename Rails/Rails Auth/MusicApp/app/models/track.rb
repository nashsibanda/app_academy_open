class Track < ApplicationRecord
  validates :title, :ord, :album_id, presence: true

  has_many :notes, dependent: :destroy
  belongs_to :album
  delegate :band, to: :album, allow_nil: true
end