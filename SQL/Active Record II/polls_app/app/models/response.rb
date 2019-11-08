class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :not_duplicate_response

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << 'can not respond to the same question multiple times.'
    end
  end
  
  def sibling_responses
    self.question.responses
      .where.not(id: self.id)
  end

  def respondent_already_answered?
    !self.sibling_responses.empty?
  end

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  has_one :question, through: :answer_choice
end