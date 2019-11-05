class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :submitter_id, presence: true
  validate :no_spamming, :nonpremium_max

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

  def self.prune(mins)
    ShortenedUrl
      .joins(:submitter)
      .left_joins(:visits)
      .where("(shortened_urls.id IN (
        SELECT shortened_urls.id 
        FROM shortened_urls 
        JOIN visits
        ON visits.shortened_url_id = shortened_urls.id 
        GROUP BY shortened_urls.id 
        HAVING MAX(visits.created_at) < ?
      ) OR (
        visits.id IS NULL AND shortened_urls.created_at < ? 
      )) AND users.premium = ?", mins.minutes.ago, mins.minutes.ago, false)
      .destroy_all
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

  def no_spamming
    if self.submitter.submitted_urls.where("shortened_urls.created_at >= ?", 5.minutes.ago ).count >= 5
      errors[:submitter_id] << "Too many submissions at once!"
    end
  end
  
  def nonpremium_max
    unless self.submitter.submitted_urls.count < 7 || self.submitter.premium
      errors[:submitter_id] << "Non-premium members can only have 20 ShortURLs"
    end
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User
  
  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :taggings,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Tagging
  
  has_many :tags, through: :taggings, source: :topic
  
  has_many :visitors, Proc.new { distinct }, through: :visits, source: :visitor
end