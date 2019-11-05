class TagTopic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true

  def self.new_topic(topic)
    raise "This topic already exists!" if TagTopic.exists?(topic: topic)
    TagTopic.create!(topic: topic)
  end

  def popular_links
    links = self.shortened_urls.left_joins(:visits).group(:id).order('COUNT(visits.id) DESC').limit(5)
    links.map { |link| [link.long_url, "Visited #{link.num_clicks} times"] }
  end

  has_many :taggings,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :Tagging
  
  has_many :shortened_urls, through: :taggings, source: :shortened_url
end