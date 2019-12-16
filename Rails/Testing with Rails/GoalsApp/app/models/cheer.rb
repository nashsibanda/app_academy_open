class Cheer < ApplicationRecord
  validates :cheerer_id, presence: true

  belongs_to :cheerable, polymorphic: true
  belongs_to :cheerer, class_name: "User", foreign_key: "cheerer_id"
end
