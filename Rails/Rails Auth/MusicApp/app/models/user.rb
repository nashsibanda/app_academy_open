class User < ApplicationRecord
  attr_reader :password

  validates :email, :session_token, :password_digest, presence: true
  validates :password, length: { minimum:6, allow_nil: true, message: "must be longer than 6 characters" }
  validates :email, uniqueness: true
  after_initialize :ensure_session_token

  has_many :notes, dependent: :destroy

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user && user.is_password?(password)
    user
  end
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end