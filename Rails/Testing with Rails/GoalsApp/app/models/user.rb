class User < ApplicationRecord
  include Commentable
  attr_reader :password

  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates_length_of :password, minimum: 6, message: "must be at least 6 characters", allow_nil: true
  after_initialize :ensure_session_token

  has_many :goals

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return user if user && user.is_password?(password)
    nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
  end

  def generate_activation_token!
    self.activation_token = SecureRandom.urlsafe_base64
  end

  def public_goals
    self.goals.where(private: false)
  end

  private
  def ensure_session_token
    self.session_token = self.class.generate_session_token
  end

end
