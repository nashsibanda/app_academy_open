class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  def completed_polls_sql
    Poll.find_by_sql [
    " SELECT
        polls.* 
      FROM
        polls 
      JOIN
        questions ON questions.poll_id = polls.id 
      LEFT JOIN (
        SELECT  
          responses.user_id, 
          answer_choices.question_id AS question_id
        FROM
          responses 
        JOIN
          answer_choices ON answer_choices.id = responses.answer_choice_id 
        WHERE
          responses.user_id = ?
      ) AS user_responses ON user_responses.question_id = questions.id 
      GROUP BY
        polls.id 
      HAVING
        Count(user_responses.*) = Count(questions.*)
    ", self.id]
  end

  def completed_polls
    Poll
      .all
      .left_joins(questions: [ {answer_choices: :responses}] )
      .where('responses.user_id = ?', self.id)
      .group(:id)
      .having("Count(responses.*) = Count(questions.*)")
      # .left_joins(["SELECT  
      #     responses.user_id, 
      #     answer_choices.question_id AS question_id
      #   FROM
      #     responses 
      #   JOIN
      #     answer_choices ON answer_choices.id = responses.answer_choice_id 
      #   WHERE
      #     responses.user_id = ?", self.id])
  end

  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Poll
  
  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Response
end