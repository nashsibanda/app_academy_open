require_relative 'reqs'

class Reply
  attr_accessor :id, :question_id, :parent_reply_id, :replier_id, :body

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @replier_id = options['replier_id']
    @body = options['body']
  end

  # Class Methods
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end
  
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    data.map { |datum| Reply.new(datum) }.first
  end
  
  def self.find_by_user_id(replier_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, replier_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replier_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end
  
  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end
  
  def self.find_by_parent_reply_id(parent_reply_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end
  
  # Instance methods
  def author
    User.find_by_id(@replier_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    raise "This is a top-level reply" unless self.parent_reply_id
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    Reply.find_by_parent_reply_id(@id)
  end

end
