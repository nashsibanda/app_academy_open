class Tagging < ApplicationRecord
  validates :shortened_url_id, presence: true
  validates :topic_id, presence: true

  def self.tag_link(shortened_url, topic)
    TagTopic.new_topic(topic) unless TagTopic.exists?(topic: topic)
    selected_topic = TagTopic.find_by(topic: topic)
    raise "This link already has the #{topic} tag!" if Tagging.exists?(shortened_url_id: shortened_url.id, topic_id: selected_topic.id)
    Tagging.create!(shortened_url_id: shortened_url.id, topic_id: selected_topic.id)
  end

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl
  
  belongs_to :topic,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :TagTopic
end