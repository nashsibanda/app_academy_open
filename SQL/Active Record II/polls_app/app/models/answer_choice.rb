class AnswerChoice < ApplicationRecord
  validates :question_id, presence: true
  validates :text, presence: true
end