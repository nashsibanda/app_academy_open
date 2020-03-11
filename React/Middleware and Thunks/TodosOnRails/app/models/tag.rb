# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :taggings
  has_many :todos, through: :taggings, source: :todo, dependent: :destroy
end
