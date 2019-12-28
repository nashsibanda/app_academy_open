class Comment < ApplicationRecord
  validates :content, :author, :sub, presence: true

  belongs_to :parent_comment, class_name: "Comment", foreign_key: :parent_comment_id, optional: true
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :post
  has_many :child_comments, class_name: "Comment", foreign_key: :parent_comment_id
end
