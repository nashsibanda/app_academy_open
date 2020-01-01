class Post < ApplicationRecord
  extend FriendlyId
  include Votable
  validates :title, :author, :sub, presence: true
  belongs_to :sub
  belongs_to :crosspost_parent, class_name: "Post", foreign_key: :crosspost_parent_id, optional: true
  has_many :crossposts, class_name: "Post", foreign_key: :crosspost_parent_id
  has_many :comments
  belongs_to :author, class_name: "User", foreign_key: :author_id
  friendly_id :title, use: :slugged

  def short_title
    case
    when self.title.length <= 20
      return self.title
    when self.title.length > 20
      return "#{self.title[0..19]}..."
    end
  end

  def comments_by_parent_id
    output_hash = Hash.new { |h, k| h[k] = []  }
    self.comments.includes(:author).each do |comment|
      output_hash[comment.parent_comment_id] << comment
    end
    output_hash
  end
end
