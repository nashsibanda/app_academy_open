class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :submitter_id, presence: true

  def self.random_code
    code = SecureRandom.urlsafe_base64
    until !ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.new_short_url(orig_url, user)
    ShortenedUrl.create!(long_url: orig_url, short_url: ShortenedUrl.random_code, submitter_id: user.id)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User
end