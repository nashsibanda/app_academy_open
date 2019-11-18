class Cat < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F), message: "%{value} is not a valid sex, please choose M or F"}, length: { is: 1 }
  validates :color, presence: true, inclusion: { in: %w(black brown grey white tabby), message: "%{value} is not a recognised colour" }

  def age
    time_ago_in_words(self.birth_date, only: :years)
  end

end