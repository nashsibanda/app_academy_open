class User < ApplicationRecord
  attr_reader :password
  validates :name, :session_token, :password_digest, presence: true
  validates_uniqueness_of :name, on: :create, message: "is already taken"
  validates_length_of :password, minimum: 6, message: "music be at least 6 characters", allow_nil: true
  after_initialize :ensure_session_token

  has_many :moderator_moderated_subs, foreign_key: :moderator_id, dependent: :destroy
  has_many :moderated_subs, through: :moderator_moderated_subs, source: :sub
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(name, password)
    user = User.find_by(name: name)
    return user if user && user.is_password?(password)
    nil
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(input)
    BCrypt::Password.new(self.password_digest) == input
  end

  def posts_and_comments
    composite = self.posts + self.comments
    composite.sort { |a, b| b.created_at <=> a.created_at }
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
