module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def vote_value
    return 0 if self.votes.empty?
    total = self.votes.map {|vote| vote.value}.sum
    return total
  end
  
end