class Sub < ApplicationRecord
  extend FriendlyId
  validates_uniqueness_of :name, on: :create, message: "is already taken by another sub"
  validates :name, :description, presence: true
  validate :name_must_be_alphanumeric

  has_many :moderator_moderated_subs, dependent: :destroy
  has_many :moderators, through: :moderator_moderated_subs, source: :moderator
  has_many :posts, dependent: :destroy
  friendly_id :name, use: :slugged
  
  def name_must_be_alphanumeric
    allowed = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a + ["_"]
    if self.name.present? && self.name.split.any? {|ch| !allowed.include?(ch)}
      errors.add(:name, "can only contain alphanumeric characters and underscores")
    end
  end

end
