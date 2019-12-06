FactoryBot.define do
  factory :user do
    email { "test-username" }
    # password_digest { BCrypt::Password.create("testpass") }
    password { "test-password" }
    activated { true }
  end
end
