class Goal < ApplicationRecord
  include Commentable
  include Cheerable
  validates_presence_of :user_id, :title
  validates :deadline, date: { after_or_equal_to: Proc.new {Time.now}, message: 'must not be in the past', allow_blank: true }

  belongs_to :user

  def overdue?
    unless self.deadline.nil?
      return true if self.deadline < Date.today
    end
    false
  end

end
