class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :artist_id, message: "can't be the same as another artwork by the same artist" }
  validates :artist_id, presence: true
  validates :image_url, presence: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User
end