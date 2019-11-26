class User < ApplicationRecord
  attr_reader :password

  validates :email, :session_token, :password_digest, presence: true
  validates :password, length: { minimum:6, allow_null: true, message: "Password must be longer than 6 characters" }
  validates :email, uniqueness: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

end