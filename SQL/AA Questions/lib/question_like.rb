require_relative 'reqs'

class QuestionLike
  attr_accessor :id, :question_id, :liker_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @liker_id = options['liker_id']
  end

  # Class Methods
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end
  
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    data.map { |datum| QuestionLike.new(datum) }.first
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.id, users.fname, users.lname
      FROM
        users
      JOIN question_likes ON liker_id = users.id
      WHERE
        question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.id, questions.title, questions.body, questions.author_id
      FROM
        questions
      JOIN question_likes ON question_likes.question_id = questions.id
      WHERE
        liker_id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(liker_id) as likes
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    data.first['likes']
  end

  def self.most_liked_questions(amount)
    data = QuestionsDatabase.instance.execute(<<-SQL, amount)
      SELECT
        questions.id, title, body, author_id
      FROM
        questions
      JOIN
        question_likes ON question_likes.question_id = questions.id
      GROUP BY
        questions.id, title, body, author_id
      ORDER BY
        COUNT(liker_id) DESC
      LIMIT ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

end
