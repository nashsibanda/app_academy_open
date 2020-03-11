# frozen_string_literal: true

class Todo < ApplicationRecord
  validates :title, presence: true
  validates :done, inclusion: { in: [true, false] }
  belongs_to :user
  has_many :steps
  has_many :taggings
  has_many :tags, through: :taggings, source: :tag, dependent: :destroy

  def tag_names=(tag_names)
    tag_names = [] if tag_names == ['NULLNULLNULL']
    self.tags = tag_names.map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end
  end
end
