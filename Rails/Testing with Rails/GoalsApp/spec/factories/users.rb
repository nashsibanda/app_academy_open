FactoryBot.define do
  factory :user do
    email {"test"}
    password_digest {"passdigest"}
    session_token {"sessiontoken"}
    activation_token {"activationtoken"}
    activated { true }
  end
end
