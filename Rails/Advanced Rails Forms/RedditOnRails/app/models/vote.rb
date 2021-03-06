class Vote < ApplicationRecord
  validates :voter_id, :value, presence: true
  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: "User", foreign_key: :voter_id
end