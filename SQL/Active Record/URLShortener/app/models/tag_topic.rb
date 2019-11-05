class TagTopic < ApplicationRecord
  validates :topic, presence: true

  def self.new_topic(topic)
    raise "This topic already exists!" if TagTopic.exists?(topic: topic)
    TagTopic.create!(topic: topic)
  end
end