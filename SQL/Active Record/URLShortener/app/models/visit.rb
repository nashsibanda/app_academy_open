class Visit < ApplicationRecord
  validates :shortened_url_id, presence: true
  validates :user_id, presence: true
end