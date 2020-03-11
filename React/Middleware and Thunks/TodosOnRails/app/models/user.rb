# frozen_string_literal: true

class User < ApplicationRecord
  attr_reader :password
  validates :username, :session_token, :password_digest, presence: true
  validates_uniqueness_of :username, on: :create, message: 'is already taken'
  validates_length_of :password, minimum: 6, on: :create, message: 'must be at least 6 characters', allow_nil: true
  after_initialize :ensure_session_token

  has_many :todos

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user&.is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest) == password
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
