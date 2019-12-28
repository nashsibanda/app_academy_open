class Post < ApplicationRecord
  validates :title, :author, :sub, presence: true

  belongs_to :sub
  belongs_to :crosspost_parent, class_name: "Post", foreign_key: :crosspost_parent_id, optional: true
  has_many :crossposts, class_name: "Post", foreign_key: :crosspost_parent_id
  has_many :comments
  belongs_to :author, class_name: "User", foreign_key: :author_id
end
