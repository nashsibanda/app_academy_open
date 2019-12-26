class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def tidy_created_at
    self.created_at.strftime("%H:%M, %d/%m/%Y")
  end

end
