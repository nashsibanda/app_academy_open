class Note < ApplicationRecord
  validates :user_id, :album_id, :text, presence: true

  belongs_to :user
  belongs_to :track
end