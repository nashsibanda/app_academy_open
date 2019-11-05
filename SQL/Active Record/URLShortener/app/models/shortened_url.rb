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

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    recent_uniques = self.visitors.where("visits.created_at >= ?", 10.minutes.ago )
    recent_uniques.count
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User
  
  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit
  
  has_many :visitors, Proc.new { distinct }, through: :visits, source: :visitor
end