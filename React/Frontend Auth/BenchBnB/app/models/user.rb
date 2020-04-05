# frozen_string_literal: true

class User < ApplicationRecord
  attr_reader :password

  validates :username, :email, :password_digest, presence: true
  validates_uniqueness_of :username, :email, on: :create, message: 'has already been used on this site'
  validates_length_of :password, within: 6..20, message: 'must be between 6 and 20 characters', allow_nil: true
  after_initialize :ensure_session_token

  has_many :reviews, class_name: 'Api::Review', foreign_key: 'user_id'

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user

    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save
    self.session_token
  end
end
