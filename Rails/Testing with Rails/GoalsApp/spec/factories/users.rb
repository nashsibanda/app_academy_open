FactoryBot.define do
  factory :user do
    email { "test" }
    # password_digest { BCrypt::Password.create("testpass") }
    password { "testpass" }
    activated { true }
  end
end
