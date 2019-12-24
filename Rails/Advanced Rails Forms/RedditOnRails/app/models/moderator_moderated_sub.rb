class ModeratorModeratedSub < ApplicationRecord
  belongs_to :moderator, class_name: "User", foreign_key: :moderator_id
  belongs_to :sub
end