class Sub < ApplicationRecord
  validates_uniqueness_of :name, on: :create, message: "is already taken by another sub"
  validates :name, :description, presence: true

  has_many :moderator_moderated_subs, dependent: :destroy
  has_many :moderators, through: :moderator_moderated_subs, source: :moderator
  has_many :posts, dependent: :destroy
  
end
