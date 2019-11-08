class Question < ApplicationRecord
  validates :poll_id, presence: true
  validates :text, presence: true

  def results
    results = {}
    AnswerChoice
      .select('answer_choices.text as answer, COUNT(responses.*) as responses')
      .left_joins(:responses)
      .where('answer_choices.question_id = ?', self.id)
      .group('answer')
      .order('responses DESC')
      .each { |r| results[r.attributes["answer"]] = r.attributes["responses"] }
    results
  end

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses, through: :answer_choices
end