class Comment < ApplicationRecord
  validates :text, :commenter_id, presence: true
  
  belongs_to :commentable, polymorphic: true
end
