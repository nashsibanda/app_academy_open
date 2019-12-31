class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include ActionView::Helpers::DateHelper

  def tidy_created_at
    self.created_at.strftime("%d/%m/%Y")
  end

  def tidy_age
    time_ago_in_words(self.created_at)
  end

end
