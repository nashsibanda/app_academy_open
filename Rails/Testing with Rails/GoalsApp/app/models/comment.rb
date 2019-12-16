class Comment < ApplicationRecord
  include Cheerable
  validates :text, :commenter_id, presence: true
  
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: "User", foreign_key: "commenter_id"
end
