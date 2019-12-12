class Goal < ApplicationRecord
  include Commentable
  validates_presence_of :user_id, :title
  validates :deadline, date: { after_or_equal_to: Proc.new {Time.now}, message: 'must not be in the past', allow_blank: true }

  belongs_to :user

  def overdue?
    return true if self.deadline < Date.today
    false
  end

end
