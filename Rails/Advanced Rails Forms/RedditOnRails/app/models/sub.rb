class Sub < ApplicationRecord
  validates_uniqueness_of :name, on: :create, message: "is already taken by another sub"
  validates :name, :description, :moderator_id, presence: true

  
end
