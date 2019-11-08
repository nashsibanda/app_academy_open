class Response < ApplicationRecord
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :not_answering_own_poll
  
  private

  def not_answering_own_poll
    if self.user_id == question.poll.author_id
      errors[:user_id] << 'can not respond to their own poll.'
    end
  end

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
    sibling_responses.exists?( user_id: self.user_id )
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