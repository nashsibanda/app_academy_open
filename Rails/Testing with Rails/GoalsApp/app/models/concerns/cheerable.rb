module Cheerable
  extend ActiveSupport::Concern

  included do
    has_many :cheers, as: :cheerable
  end

  def cheer_count
    self.cheers.count
  end
end