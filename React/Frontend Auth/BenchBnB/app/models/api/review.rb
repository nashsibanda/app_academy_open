# frozen_string_literal: true

class Api::Review < ApplicationRecord
  validates_presence_of :rating, :comment, message: "can't be blank"
  validates_inclusion_of :rating, in: 1..5, message: 'must be between 1 and 5'

  belongs_to :bench, class_name: 'Api::Bench', foreign_key: 'api_bench_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
end
