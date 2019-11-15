class Comment < ApplicationRecord
  validates :artwork_id, presence: true
  validates :commenter_id, presence: true
  validates :body, presence: true

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :commenter,
    primary_key: :id,
    foreign_key: :commenter_id,
    class_name: :User
end