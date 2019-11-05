class Tagging < ApplicationRecord
  validates :shortened_url_id, presence: true
  validates :topic_id, presence: true

  def self.tag_link(shortened_url, topic)
    TagTopic.new_topic(topic) unless TagTopic.exists?(topic: topic)
    selected_topic = TagTopic.find_by(topic: topic)
    raise "This link already has the #{topic} tag!" if Tagging.exists?(shortened_url_id: shortened_url.id, topic_id: selected_topic.id)
    Tagging.create!(shortened_url_id: shortened_url.id, topic_id: selected_topic.id)
  end
end