class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
end